class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.0/consul-dataplane_1.7.0_darwin_amd64.zip"
    sha256 "a7a35ab599621651c3dd1f5bb7d1c8af856ff5831ddced32036323fcf747baee"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.0/consul-dataplane_1.7.0_darwin_arm64.zip"
    sha256 "34b5c4466093199b5c5d2223c779483bd05d47715894573ef03a72e90c8cba8d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.0/consul-dataplane_1.7.0_linux_amd64.zip"
    sha256 "4cfdd0542e1a58f8ee57d5b66ba408ca5c5ecb354b18a5c7ac8f871364db6e89"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.0/consul-dataplane_1.7.0_linux_arm.zip"
    sha256 "143421e81b4a7cb1ae7683d77faaa24a896b20da3ed8da47d3ab81373eaf26d2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.0/consul-dataplane_1.7.0_linux_arm64.zip"
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