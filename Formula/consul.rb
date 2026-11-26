class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "2.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul/2.1.0/consul_2.1.0_darwin_amd64.zip"
    sha256 "40e614b6bf47e85387c7a9f65b97e4f0a6f21057c4e50e1b05cbc4691b338d99"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul/2.1.0/consul_2.1.0_darwin_arm64.zip"
    sha256 "236d6a579c5fcfb065f416bd3a296ad199a1116c2667481bffdfdc60a5e61468"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul/2.1.0/consul_2.1.0_linux_amd64.zip"
    sha256 "a9c9cdf1ed93bd29a9671b02e5433131f3f777bab16c076fcef712a2820bfe33"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul/2.1.0/consul_2.1.0_linux_arm.zip"
    sha256 "6bea91aca838972fe709554787bccbefc8913948456dbec90a9db32dc72b679c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul/2.1.0/consul_2.1.0_linux_arm64.zip"
    sha256 "eb34b81592e25eadb3fbc553afb2036004dcd316d99a1a8e40a177fde4e0e537"
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