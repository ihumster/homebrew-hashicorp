class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.4.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.6/consul-dataplane_1.4.6_darwin_amd64.zip"
    sha256 "813a42c582604e2c936c05aa58351ea2123fabb09aafb6eb667ce8b85cb4f366"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.6/consul-dataplane_1.4.6_darwin_arm64.zip"
    sha256 "3f934e21c4bd4b51e589fd641a8bcbe4ddd27319f5a1c3a5419c4547adaf4e74"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.6/consul-dataplane_1.4.6_linux_amd64.zip"
    sha256 "be8e376198026004f4c87222f0ca1d84088afdbc711a72a348b2062774d310d7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.6/consul-dataplane_1.4.6_linux_arm.zip"
    sha256 "76f89dc1f26823439b900956d397285416e2989a54af1ca758acba8547f295db"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.6/consul-dataplane_1.4.6_linux_arm64.zip"
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