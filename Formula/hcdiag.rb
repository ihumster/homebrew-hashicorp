class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version ""

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/hcdiag//hcdiag__darwin_amd64.zip"
    sha256 ""
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/hcdiag//hcdiag__darwin_arm64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/hcdiag//hcdiag__linux_amd64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/hcdiag//hcdiag__linux_arm.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/hcdiag//hcdiag__linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end