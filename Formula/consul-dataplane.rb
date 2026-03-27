class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.13"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.13/consul-dataplane_1.7.13_darwin_amd64.zip"
    sha256 "8f8a6843f7c8f79f27fb638c7ee61f897b916a41c31f07a6753446b7d4e91b23"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.13/consul-dataplane_1.7.13_darwin_arm64.zip"
    sha256 "826d8d446071ec0fbd21386275e4f445efe8e95d797210bb2232838b93ed3c25"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.13/consul-dataplane_1.7.13_linux_amd64.zip"
    sha256 "ab27d0ed48429fe20a31e0ac1ca8a208a55912afc3908fcd07700f710ac2466d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.13/consul-dataplane_1.7.13_linux_arm.zip"
    sha256 "3eb33ce0193a7eeb8208150551bcb91123b210652ede34e86d49198abc9f1163"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.13/consul-dataplane_1.7.13_linux_arm64.zip"
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