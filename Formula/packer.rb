class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version ""

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer//packer__darwin_amd64.zip"
    sha256 ""
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/packer//packer__darwin_arm64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer//packer__linux_amd64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer//packer__linux_arm.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer//packer__linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end