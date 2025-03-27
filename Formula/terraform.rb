class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.11.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.11.3/terraform_1.11.3_darwin_amd64.zip"
    sha256 "bcdbb6f35c536da333d410cd0d0c1f5d543c4f40d46c8f96e419190fe3e9d941"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.11.3/terraform_1.11.3_darwin_arm64.zip"
    sha256 "c0c64fa7b859f505fdcefdab89317e98b268f68d401da87df0b0021e827cf197"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.11.3/terraform_1.11.3_linux_amd64.zip"
    sha256 "377c8c18e2beab24f721994859236e98383350bf767921436511370d1f7c472b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.11.3/terraform_1.11.3_linux_arm.zip"
    sha256 "d685953bec501c0acda13319f34dddaadf33a8f553c85533531d3c7d5f84604a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.11.3/terraform_1.11.3_linux_arm64.zip"
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