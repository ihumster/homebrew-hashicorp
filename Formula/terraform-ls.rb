class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.1/terraform-ls_0.38.1_darwin_amd64.zip"
    sha256 "ccab0879e1227703765c8b1d3d7d99f716c8330e588bc62d105b962d427f9810"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.1/terraform-ls_0.38.1_darwin_arm64.zip"
    sha256 "c8430c498f722244eeb7c573d4d327113c617bd9911b06e461148446dd171b1d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.1/terraform-ls_0.38.1_linux_amd64.zip"
    sha256 "c5869f946b0d17e2c13157dc3bc2aea87fab12d39ac17b3a198102332e79bf62"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.1/terraform-ls_0.38.1_linux_arm.zip"
    sha256 "df903934b1b097df446eaa9ffe0b7ae2947e27242c381fde12a92ec50264ac23"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.1/terraform-ls_0.38.1_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end