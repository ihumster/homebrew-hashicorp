class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version ""

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/envconsul//envconsul__darwin_amd64.zip"
    sha256 ""
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/envconsul//envconsul__darwin_arm64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/envconsul//envconsul__linux_amd64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/envconsul//envconsul__linux_arm.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/envconsul//envconsul__linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end