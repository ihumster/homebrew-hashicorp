class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version ""

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/boundary//boundary__darwin_amd64.zip"
    sha256 ""
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/boundary//boundary__darwin_arm64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/boundary//boundary__linux_amd64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/boundary//boundary__linux_arm.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/boundary//boundary__linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end