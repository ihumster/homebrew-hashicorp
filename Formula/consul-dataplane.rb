class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.8.2/consul-dataplane_1.8.2_darwin_amd64.zip"
    sha256 "1eaeb06678aa89dc5d75f978207198446104e69abb84dfa01f308ca4635d7984"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.8.2/consul-dataplane_1.8.2_darwin_arm64.zip"
    sha256 "3aa13657506428370e21188c825f8720ff9dfe423b88f49118d782649a2adc93"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.8.2/consul-dataplane_1.8.2_linux_amd64.zip"
    sha256 "1787b1ec3b6f62b55159f1015816dd33bed9090e150641bedafa7a64d441200f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.8.2/consul-dataplane_1.8.2_linux_arm.zip"
    sha256 "21b146c399912021520483e4123772db26f3d579ef5c607f7adb5aadd1337e5a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.8.2/consul-dataplane_1.8.2_linux_arm64.zip"
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