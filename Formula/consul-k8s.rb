class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.8.17"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.17/consul-k8s_1.8.17_darwin_amd64.zip"
    sha256 "eb6366f1789e0f514909ddcdb3d10af66dfecca14f83e62a56f1979f679e9a48"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.17/consul-k8s_1.8.17_darwin_arm64.zip"
    sha256 "0bde8c88c4ac5e580712ed732da61c2dbf887f5c7c03fedb1041d4d4c3710a74"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.17/consul-k8s_1.8.17_linux_amd64.zip"
    sha256 "7fc485448a7fef7266df12489203b38f085c48a39ce8fcb58abb94cae7b7f99d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.17/consul-k8s_1.8.17_linux_arm.zip"
    sha256 "5fcef82d2cfa022291f4c93dff726e14461fc22a0887cfe2e8da68409081a421"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.17/consul-k8s_1.8.17_linux_arm64.zip"
    sha256 "88a74f68b3c703336197fef789f1ba0b8609317fb29b60a8f0f6890c2fd53542"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end