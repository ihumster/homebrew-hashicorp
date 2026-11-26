class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.17.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.17.2/terraform_1.17.2_darwin_amd64.zip"
    sha256 "66b472dcc36cf770d83757ed4d002c476174842c05c68637b40a7e99519cf3e1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.17.2/terraform_1.17.2_darwin_arm64.zip"
    sha256 "da0c7ef278a911347862758e7573a5907365e66485c2637cf5c217c5e227992e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.17.2/terraform_1.17.2_linux_amd64.zip"
    sha256 "e6f16b2f0b137ee5729caa8c4e79a3bae4ee261acd198a1fcfa8584a6296605b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.17.2/terraform_1.17.2_linux_arm.zip"
    sha256 "cd4dfed6a2c310f736e33b9e2f3ddcd86c81b392e5d31b51cb55462e6f19e452"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.17.2/terraform_1.17.2_linux_arm64.zip"
    sha256 "858e08c181a76b6b223e8c767a8e983922eebe2d062db949a2de66ce040c368c"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end