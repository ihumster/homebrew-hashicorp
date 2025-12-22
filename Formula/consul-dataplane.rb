class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.7.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.8/consul-dataplane_1.7.8_darwin_amd64.zip"
    sha256 "43c640345ae468fc77dfb34595df9906d05a5832337caee13feaffd055904a23"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.8/consul-dataplane_1.7.8_darwin_arm64.zip"
    sha256 "5fe01573734e9c8c7eea0a153201cd8f2e04e764610ad0206d5f11a1f713461a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.8/consul-dataplane_1.7.8_linux_amd64.zip"
    sha256 "5613d9145636b7e0ffd352214301f0c226fc4c98c5d2aaebda02b30e801841d6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.8/consul-dataplane_1.7.8_linux_arm.zip"
    sha256 "1b28b30b26439fead28bf22a89a7864865ff927fc426872042944efe7670d061"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.7.8/consul-dataplane_1.7.8_linux_arm64.zip"
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