class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.8.14"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.14/consul-k8s_1.8.14_darwin_amd64.zip"
    sha256 "c364aa878b5fd12036385347469f24404eca9c2eb77f7155e0ec2e3804d77c89"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.14/consul-k8s_1.8.14_darwin_arm64.zip"
    sha256 "e6eb1ce68472e5ed8bc8b74388853b209e95fae33aac227cae1ce4884a364693"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.14/consul-k8s_1.8.14_linux_amd64.zip"
    sha256 "d6f9f77ec9a7a5595ebb619036c23023ef0f2799d6a158e1c5a79cfb7d8e83b7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.14/consul-k8s_1.8.14_linux_arm.zip"
    sha256 "a821e38aab87b0e748dfb81e2584abda6c7d81dd1fd98e8b84c096698b70938c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.14/consul-k8s_1.8.14_linux_arm64.zip"
    sha256 "67e0926b5b425ad6bf398b1d5b5b85bbaab99f1b63c4a884a651d4060ec1372f"
  end

  conflicts_with "consul-k8s"

  def install
    bin.install "consul-k8s"
  end

  test do
    system "#{bin}/consul-k8s --version"
  end
end