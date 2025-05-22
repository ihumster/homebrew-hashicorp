class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.12.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.12.1/terraform_1.12.1_darwin_amd64.zip"
    sha256 "bb5bc5c846a4b41b414a6598775a27e3fbb0405ef9b36a61789df5639a9860f5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.12.1/terraform_1.12.1_darwin_arm64.zip"
    sha256 "30dd56df622fc4d477f24abe7c19856c4c1c22284e20db6d7fa4c53bcfacfb20"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.12.1/terraform_1.12.1_linux_amd64.zip"
    sha256 "dcaf8ba801660a431a6769ec44ba53b66c1ad44637512ef3961f7ffe4397ef7c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.12.1/terraform_1.12.1_linux_arm.zip"
    sha256 "70e8c1776646f2af83ccad6113b8bb4768e6f7dc65335ae11ffd095eca3b0d4c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.12.1/terraform_1.12.1_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end