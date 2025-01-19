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


def load_hcl_config():
    url = "https://raw.githubusercontent.com/hashicorp/homebrew-tap/refs/heads/master/util/formula_templater/config.hcl"

    response = requests.get(url)

    config = None

    if response.status_code == 200:
        config = hcl2.loads(response.text)
    return config


def get_latest_release(repo, owner=owner):
    url = f"https://api.github.com/repos/{owner}/{repo}/releases/latest"

    response = requests.get(url)

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
                if "darwin_amd64" in file:
                    ret_dict.update({"darwin_amd64_sha": sum})
                elif "darwin_arm64" in file:
                    ret_dict.update({"darwin_arm64_sha": sum})
                elif "linux_amd64" in file:
                    ret_dict.update({"linux_amd64_sha": sum})
                elif "linux_arm" in file:
                    ret_dict.update({"linux_arm_sha": sum})
                elif "linux_arm64" in file:
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
                productShaDict = get_product_sha256(
                    product["name"], latest_release_version
                )
                if productConfig and productShaDict:
                    productConfig["architectures"][0].update(productShaDict)
                    productConfig.update({"version": latest_release_version})
                else:
                    print(f"Error getting config or sha256 for '{product['name']}'")
                    # break

                rendered_content = template.render(productConfig)
                with open(product["file_path"], "w", encoding="utf-8") as out_file:
                    out_file.write(rendered_content)

    else:
        print("Error loading hashicorp hcl config")


if __name__ == "__main__":
    main()
