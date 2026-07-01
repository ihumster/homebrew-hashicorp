import os
import re

import hcl2
import requests
from jinja2 import Environment, FileSystemLoader

directory = "Formula"
owner = "hashicorp"

template_path = "utils/templates"
env = Environment(loader=FileSystemLoader(template_path), trim_blocks=True)
template = env.get_template("Formula.j2")

github_token = os.environ.get("GITHUB_TOKEN")
github_headers = {"Authorization": f"Bearer {github_token}"} if github_token else {}


def unquote(value):
    """Strip surrounding double quotes returned by python-hcl2 >= 4.x.

    Newer python-hcl2 keeps the literal quotes around string values (e.g.
    '"boundary"'), which breaks equality checks and template rendering. This
    recursively removes them from strings inside dicts and lists.
    """
    if isinstance(value, str) and len(value) >= 2 and value[0] == '"' and value[-1] == '"':
        return value[1:-1]
    if isinstance(value, list):
        return [unquote(item) for item in value]
    if isinstance(value, dict):
        return {key: unquote(item) for key, item in value.items()}
    return value


def load_hcl_config():
    url = "https://raw.githubusercontent.com/hashicorp/homebrew-tap/refs/heads/master/util/formula_templater/config.hcl"

    response = requests.get(url)

    config = None

    if response.status_code == 200:
        config = unquote(hcl2.loads(response.text))
    return config


def get_latest_release(repo, owner=owner):
    url = f"https://api.github.com/repos/{owner}/{repo}/releases/latest"

    response = requests.get(url, headers=github_headers)

    if response.status_code == 200:
        release_date = response.json()
        return release_date["name"].lstrip("v")
    else:
        return None


def get_product_sha256(product, version):
    if product and version:
        url = f"https://hashicorp-releases.yandexcloud.net/{product}/{version}/{product}_{version}_SHA256SUMS"

        response = requests.get(url)
        ret_dict = {}
        if response.status_code == 200:
            for line in response.iter_lines():
                sum, file = line.decode("utf-8").split("  ")
                if "darwin_amd64." in file:
                    ret_dict.update({"darwin_amd64_sha": sum})
                elif "darwin_arm64." in file:
                    ret_dict.update({"darwin_arm64_sha": sum})
                elif "linux_amd64." in file:
                    ret_dict.update({"linux_amd64_sha": sum})
                elif "linux_arm." in file:
                    ret_dict.update({"linux_arm_sha": sum})
                elif "linux_arm64." in file:
                    ret_dict.update({"linux_arm64_sha": sum})

        return ret_dict
    return None


def get_hcl_config(product, config):
    for conf in config["formula"]:
        if conf["product"] == product:
            return conf


def main():
    config = load_hcl_config()

    if config:
        products = []
        for filename in os.listdir(directory):
            if filename.endswith(".rb"):
                file_path = os.path.join(directory, filename)

                with open(file_path, "r", encoding="utf-8") as file:
                    content = file.readlines()

                version_value = None

                for line in content:
                    match = re.match(r'^\s*version\s*"(.*)"\s*$', line)
                    if match:
                        version_value = match.group(1)
                        break
                name = filename[:-3]
                products.append(
                    {
                        "name": name,
                        "version": str(version_value),
                        "file_path": file_path,
                    }
                )

        for product in products:
            latest_release_version = get_latest_release(product["name"])
            if not product["version"] or product["version"] != latest_release_version:
                productConfig = get_hcl_config(product["name"], config)
                if not productConfig:
                    print(f"[WARN] No HCL config found for '{product['name']}'")
                productShaDict = get_product_sha256(
                    product["name"], latest_release_version
                )
                if not productShaDict:
                    print(
                        f"[WARN] No SHA256 found for '{product['name']}' v{latest_release_version}"
                    )
                if productConfig and productShaDict:
                    productConfig["architectures"][0].update(productShaDict)
                    productConfig.update({"version": latest_release_version})
                    rendered_content = template.render(productConfig)
                    with open(product["file_path"], "w", encoding="utf-8") as out_file:
                        out_file.write(rendered_content)
                else:
                    print(f"Error getting config or sha256 for '{product['name']}'")
                    # break

    else:
        print("Error loading hashicorp hcl config")


if __name__ == "__main__":
    main()
