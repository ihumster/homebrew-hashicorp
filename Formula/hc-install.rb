class HcInstall < Formula
  desc "hc-install CLI"
  homepage "https://github.com/hashicorp/hc-install"
  version "0.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.9.2/hc-install_0.9.2_darwin_amd64.zip"
    sha256 "7895a2f9ad63eca9b479ba23658f421b921c473acbefafc111ef4e604853fc83"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.9.2/hc-install_0.9.2_darwin_arm64.zip"
    sha256 "5eac68118f9aa0767cbd9b73146b52a415be21007f9e5e3ed898f99a15c38ba9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.9.2/hc-install_0.9.2_linux_amd64.zip"
    sha256 "dfbad402f9b82fca22e41de8bfba209ed353eafff8f0adb761cfd9a723031e67"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.9.2/hc-install_0.9.2_linux_arm.zip"
    sha256 "69dbfa35fd043bb4f307cf0d8c8df7f4b55f3d9f474e00ae1df9f1f62da9b15e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/hc-install/0.9.2/hc-install_0.9.2_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "hc-install"

  def install
    bin.install "hc-install"
  end

  test do
    system "#{bin}/hc-install --version"
  end
end