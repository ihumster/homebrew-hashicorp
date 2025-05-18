class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.12.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.12.0/packer_1.12.0_darwin_amd64.zip"
    sha256 "2cdaa91b640974ad65fa95b112f4604a9c272e38f7e9f9d853aa33774aa4feeb"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.12.0/packer_1.12.0_darwin_arm64.zip"
    sha256 "448bebeb5741eebd5fdc92609e75213665366970cd607ec57e7a5516d7067b3d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.12.0/packer_1.12.0_linux_amd64.zip"
    sha256 "e859a76659570d1e29fa55396d5d908091bacacd4567c17770e616c4b58c9ace"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.12.0/packer_1.12.0_linux_arm.zip"
    sha256 "a9ea40e7757cd000836b650bd2ed825dc3af9a7d73f4e19119df4c1aa13d0fe6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.12.0/packer_1.12.0_linux_arm64.zip"
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