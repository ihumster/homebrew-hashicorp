class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.12"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.12/consul-dataplane_1.9.12_darwin_amd64.zip"
    sha256 "7dba660d46a8515a5d86e939df776428166383b71afa5a26958f77fb297ad7e4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.12/consul-dataplane_1.9.12_darwin_arm64.zip"
    sha256 "43afe8bf226546165fb70022577eba52c2ece9690a0efff83670ad0c1e303314"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.12/consul-dataplane_1.9.12_linux_amd64.zip"
    sha256 "5726e9987826be779712776358c561c0f0e553c8f9e23726396e9c0f002fb625"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.12/consul-dataplane_1.9.12_linux_arm.zip"
    sha256 "3441a72100f07ad509b2781a930eed00b0a4fe75495a1070411490e175098ce3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.12/consul-dataplane_1.9.12_linux_arm64.zip"
    sha256 "f8e4e21fa6649e1a830b1453150e9cdd98e71e22ea1d963db28acc11f601a20d"
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