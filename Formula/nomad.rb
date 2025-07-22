class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.10.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.10.3/nomad_1.10.3_darwin_amd64.zip"
    sha256 "4ebc601dc0966c1d3ce0a7fbb7718fa02624fef4ebbeeabf945b11c6e47732da"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.10.3/nomad_1.10.3_darwin_arm64.zip"
    sha256 "79e0aba45d4b087b248682056f2f3731ae974483cd87e5d2cd15a8938acea357"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.10.3/nomad_1.10.3_linux_amd64.zip"
    sha256 "a161b8d59b42555d97d37f7a75c122831be485e89dfb97d16d6b60cfaec8d88b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.10.3/nomad_1.10.3_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  service do
    run [bin/"nomad", "agent", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/nomad.log"
    error_log_path var/"log/nomad.log"
  end
  test do
    system "#{bin}/nomad --version"
  end
end