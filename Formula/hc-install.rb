class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.10.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.10.0/hc-install_0.10.0_darwin_amd64.zip"
    sha256 "90946d0b0c50646e8fd280201cf7011ea71ac8a3d1e28d390d65ed9a1849b421"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.10.0/hc-install_0.10.0_darwin_arm64.zip"
    sha256 "1d90bcb56c2a5cae548a86ad2a7be6bbd66c9f754c3bd18f782c08883609ef89"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.10.0/hc-install_0.10.0_linux_amd64.zip"
    sha256 "f56c3c52490002ab1d37867508fb73a66bf7727b2590fe47978b18c9026801d7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.10.0/hc-install_0.10.0_linux_arm.zip"
    sha256 "bf3b866eebcf8c6d58218afffa48341818cd10c11ee05c9f41d959c6d29c40a7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.10.0/hc-install_0.10.0_linux_arm64.zip"
    sha256 "e59a95ea7b483cfe680d8a97deb194c5e21d69f2e9c9568bf41749828cb92fa1"
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end