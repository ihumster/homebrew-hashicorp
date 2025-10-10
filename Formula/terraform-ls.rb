class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.38.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.2/terraform-ls_0.38.2_darwin_amd64.zip"
    sha256 "01ba5a244c4e107a971f6c421eb8d72235bf831f211e37c05164422bc77aec54"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.2/terraform-ls_0.38.2_darwin_arm64.zip"
    sha256 "b1a7d15dc8de7ca38af4c4b36c6b95adc88172c73cc9eb7da6e63d263fa32a7b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.2/terraform-ls_0.38.2_linux_amd64.zip"
    sha256 "77f2355c6de4d4a00509ff369bac7f7d8bbbe29ec4008be879fd1d357aac32e3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.2/terraform-ls_0.38.2_linux_arm.zip"
    sha256 "faf1e39c9126143b9e857c1e38760b7139f2a1edea3e0e0768e14dbf3be45d3f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/terraform-ls/0.38.2/terraform-ls_0.38.2_linux_arm64.zip"
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