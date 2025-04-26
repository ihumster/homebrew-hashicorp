class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.5.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.5.7/consul-k8s_1.5.7_darwin_amd64.zip"
    sha256 "08390e711eb6d3830a16a51eccee1872858e25d9f9da5d816ef6c962f505f060"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.5.7/consul-k8s_1.5.7_darwin_arm64.zip"
    sha256 "bc54901ad8e8bab0377cf0836d3c096b74c7fa88d81c4f2c06779298a7414719"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.5.7/consul-k8s_1.5.7_linux_amd64.zip"
    sha256 "3cb90c62715b561fcde318a3e0c2b663a96a2f5a1b974378893fe446105b95dc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.5.7/consul-k8s_1.5.7_linux_arm.zip"
    sha256 "9c42fd9489c957455d59a262d2eb2e1d61146fdccf0524c58403a8829ca4bccb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.5.7/consul-k8s_1.5.7_linux_arm64.zip"
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