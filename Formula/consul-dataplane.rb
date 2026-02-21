class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.11"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.11/consul-dataplane_1.7.11_darwin_amd64.zip"
    sha256 "42660e9419c2b916953649e297aa0d2dee34f6c61596bbe64acd4a41deb988e9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.11/consul-dataplane_1.7.11_darwin_arm64.zip"
    sha256 "d9213f8ecfe03d48325a5567f479e0ef63b91d8b8ca5bfef015882602d17b528"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.11/consul-dataplane_1.7.11_linux_amd64.zip"
    sha256 "fec9e4248b63083bdb29f9b7d615069578797fafe7102841deef3632357a9e33"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.11/consul-dataplane_1.7.11_linux_arm.zip"
    sha256 "cd784b2357d41b0553f850a628ca20f25dac8ed0eff0960ff6f16654ea18828f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.11/consul-dataplane_1.7.11_linux_arm64.zip"
    sha256 ""
  end

  depends_on "envoy" => :recommended
  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end