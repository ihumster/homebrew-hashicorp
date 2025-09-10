class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.14.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.2/packer_1.14.2_darwin_amd64.zip"
    sha256 "7ed73a8affcfa81b664b1d47db4eacd43e8038ecf2ae576b40880a64d1c80ba1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.2/packer_1.14.2_darwin_arm64.zip"
    sha256 "b053c01272f87fe669c642dfac167b0b48cfb5c119e2e946d90ef92c2407f746"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.2/packer_1.14.2_linux_amd64.zip"
    sha256 "cfefdea4ac580eba7b254ef34d25b756d4961741004e3e701a1476594d13e64a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.2/packer_1.14.2_linux_arm.zip"
    sha256 "370002d15b07c0dc47dd0d188cdea8e6746606f6fcc3b4de48d02496d71d74ee"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/packer/1.14.2/packer_1.14.2_linux_arm64.zip"
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