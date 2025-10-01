class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.2/consul-k8s_1.8.2_darwin_amd64.zip"
    sha256 "6ee0dd6200c62208993e2c7700462d28f65b1d7d54eab476befea39a8b7159fe"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.2/consul-k8s_1.8.2_darwin_arm64.zip"
    sha256 "7d2c21daf402e86f033df05fc0abd23322382798b7336f76334312d4d5a253f5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.2/consul-k8s_1.8.2_linux_amd64.zip"
    sha256 "cfe8ce3a27019a33715077fe120690d7c0390a96b3428770e00f922afe98294a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.2/consul-k8s_1.8.2_linux_arm.zip"
    sha256 "6b21d9e334b17d23b0910278fb36d3c2692bf170f349758bcb4a2b1c1996f89d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.2/consul-k8s_1.8.2_linux_arm64.zip"
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