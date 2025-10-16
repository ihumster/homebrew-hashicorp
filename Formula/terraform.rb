class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.13.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.13.4/terraform_1.13.4_darwin_amd64.zip"
    sha256 "0a4441f6aaf37bb18cbaf5c7538f9be638f0d93eb325d285b4b452d014a7737a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.13.4/terraform_1.13.4_darwin_arm64.zip"
    sha256 "6b9e2ff8102c469added7be28cd5cfc2c5a8f7fc3be2df8fe9ee5458d84a1305"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.13.4/terraform_1.13.4_linux_amd64.zip"
    sha256 "98aa516201e948306698efd9954ab4cc0d1227c2578ba56245898b5f679e590b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.13.4/terraform_1.13.4_linux_arm.zip"
    sha256 "a17bde150a4d6c9e7ece063ab634c07723b8242e078f3ae9017486277d6690c4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform/1.13.4/terraform_1.13.4_linux_arm64.zip"
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