class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.14.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.3/packer_1.14.3_darwin_amd64.zip"
    sha256 "f76d02dd10d4ded95ba9b970254820d1b081e7d5720e122fd815ab01e80eb6d0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.3/packer_1.14.3_darwin_arm64.zip"
    sha256 "e50aec4714a907db4b8fd7c1a8c92075b8dd801cac420fbd98d0d0e1470a68fe"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.3/packer_1.14.3_linux_amd64.zip"
    sha256 "95041cc0a30f05d5583be26a7c0b715f488e461418ce0c5d88ba204cb092bef1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.3/packer_1.14.3_linux_arm.zip"
    sha256 "42d920291ff495702004eb941b56143dc3efd9b66743fd949b19156422029847"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.3/packer_1.14.3_linux_arm64.zip"
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