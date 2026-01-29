class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.7.10"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.10/consul-k8s_1.7.10_darwin_amd64.zip"
    sha256 "d03efa063d144a0c39f6e378af4f0aece8d474c3c51804b46d1be6141f0e49e2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.10/consul-k8s_1.7.10_darwin_arm64.zip"
    sha256 "19eea53e090fb3cf74a4f8dfa7a0afc399377995d0fc1e26190e365c9e9b54a5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.10/consul-k8s_1.7.10_linux_amd64.zip"
    sha256 "4e780951dc3c829415488a5eed128437670ad7dce41c10f98b70099bc8d8b675"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.10/consul-k8s_1.7.10_linux_arm.zip"
    sha256 "7cef6138c653daa65080cfd6edb3bc01a674a60cbfa0e5de7e4214f8c1f8b517"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.7.10/consul-k8s_1.7.10_linux_arm64.zip"
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