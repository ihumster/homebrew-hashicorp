class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.21.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.5/consul_1.21.5_darwin_amd64.zip"
    sha256 "bcd684344eebf40aa7e2b42f5b858519b7ab87222646f7274035452ecce52f3b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.5/consul_1.21.5_darwin_arm64.zip"
    sha256 "36e141a33a3b34628ff02ec256528109a54712e9dacff3a3bd11d7e7d17d05f2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.5/consul_1.21.5_linux_amd64.zip"
    sha256 "2dfb63fcabe9f15b956cf408248d9ebe36cfd662ca182352942a3bd4e5d5faca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.5/consul_1.21.5_linux_arm.zip"
    sha256 "e7d198f9eb8c5846c1d6371985be1ba356e7aa73e6d63e2196f44ae771b87861"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.5/consul_1.21.5_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end
  test do
    system "#{bin}/consul --version"
  end
end