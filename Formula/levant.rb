class Levant < Formula
  desc "Levant"
  homepage "https://github.com/hashicorp/levant"
  version ""

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/levant//levant__darwin_amd64.zip"
    sha256 ""
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/levant//levant__darwin_arm64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/levant//levant__linux_amd64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/levant//levant__linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "levant"

  def install
    bin.install "levant"
  end

  test do
    system "#{bin}/levant --version"
  end
end