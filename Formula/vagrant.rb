class Vagrant < Formula
  desc "Development environment"
  homepage "https://www.vagrantup.com/"
  version ""

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/vagrant//vagrant__linux_amd64.zip"
    sha256 ""
  end

  conflicts_with "vagrant"

  def install
    bin.install "vagrant"
  end

  test do
    system "#{bin}/vagrant --version"
  end
end