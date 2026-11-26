class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "2.1.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/2.1.0/consul-k8s_2.1.0_darwin_amd64.zip"
    sha256 "06a57a3e07745d7acdd0130e2df17a1a86eae7059a8249b258f645b99c6c932e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/2.1.0/consul-k8s_2.1.0_darwin_arm64.zip"
    sha256 "22739433f769e41c5a36d53b681a1fbe2b5fd9482e7edbf2fb1393aacf6ef4bc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/2.1.0/consul-k8s_2.1.0_linux_amd64.zip"
    sha256 "5d1a7b86b509a7e916dd470654d19b139a4a8f477633a878c618b02c1c1ed591"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/2.1.0/consul-k8s_2.1.0_linux_arm.zip"
    sha256 "ab93cef1f9c1274f96dd48b6642ce9fbd70aeaa001e81c44624638ebb5d0602f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/2.1.0/consul-k8s_2.1.0_linux_arm64.zip"
    sha256 "9529fbfda03464c5c6069af955055e2ab2ba79f62709cfe0400c9c5ce020f076"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end