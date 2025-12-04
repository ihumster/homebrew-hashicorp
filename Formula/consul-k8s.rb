class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.7.8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.8/consul-k8s_1.7.8_darwin_amd64.zip"
    sha256 "28b1ee2790bf2033767dc12f3ba621f303c8db102ba40f250187cf539f9cc20c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.8/consul-k8s_1.7.8_darwin_arm64.zip"
    sha256 "a29a46104417b6f4507ec169dafd7c35a04c3c3ec360e2ff3fb89b7dba5e50d0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.8/consul-k8s_1.7.8_linux_amd64.zip"
    sha256 "0ecc2c15ac1523a4e269529b8fe81aa5fb6708600b330c8bde89d5d4238cc2f3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.8/consul-k8s_1.7.8_linux_arm.zip"
    sha256 "b6a179052a531359306f07f4a8a946b39e8433ded543db82a5ce8a4ef006df8d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.8/consul-k8s_1.7.8_linux_arm64.zip"
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