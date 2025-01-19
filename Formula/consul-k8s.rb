class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.1.18"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.1.18/consul-k8s_1.1.18_darwin_amd64.zip"
    sha256 "4b025091a71f8aca6a381b3edc27e93320ff191589383f4c7e157104680573c3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.1.18/consul-k8s_1.1.18_darwin_arm64.zip"
    sha256 "ebcd3daa02641cc846a4dd17f29b5a7da57a543720894ca34b3ff2cda6991a3f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.1.18/consul-k8s_1.1.18_linux_amd64.zip"
    sha256 "9e2b50ba7ca5f938748da4ccd882f9b94dc3d36e4d189e699afe18a60be11ffe"
  end

  if OS.linux? && Hardware::CPU.arm? && not Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.1.18/consul-k8s_1.1.18_linux_arm.zip"
    sha256 "ff58860d7d4cd992b819c4387a178e2c128680e060195bfeda39762d0d963d60"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.1.18/consul-k8s_1.1.18_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end