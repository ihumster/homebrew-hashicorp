class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.12"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.12/consul-dataplane_1.7.12_darwin_amd64.zip"
    sha256 "f579ab516978fcd36944d0f726cd99b07577db25e3a9753eac2ecfb33b993c3a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.12/consul-dataplane_1.7.12_darwin_arm64.zip"
    sha256 "41d7e7fc900c7161f49f5579648589b6ba85d16039fc3cbbfa7ceba2e5016fb3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.12/consul-dataplane_1.7.12_linux_amd64.zip"
    sha256 "135dc4e619373a25842a316d6b42502a6e3d396dcf7e4dd09bf5eaa890e9f244"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.12/consul-dataplane_1.7.12_linux_arm.zip"
    sha256 "73284e5ffbd507f6c3cf589ad91c093b01a8b989576908c6b2c8500eae1ed21d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.12/consul-dataplane_1.7.12_linux_arm64.zip"
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