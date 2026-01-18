class ConsulTemplate < Formula
  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.41.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-template/0.41.3/consul-template_0.41.3_darwin_amd64.zip"
    sha256 "146fae3c941cbb5834ec3748f3f7a1c12a1bd2c2a465df6a4c2f6db098de0036"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-template/0.41.3/consul-template_0.41.3_darwin_arm64.zip"
    sha256 "5531e61180690f592a0bd9d493a1741d6c4810d8c9e023fba8a5b6ad90a75c48"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-template/0.41.3/consul-template_0.41.3_linux_amd64.zip"
    sha256 "f708323c5a9eeedf1e125662fa1dd3c54f8cadd0758ef2a9a27c7a22e181e93c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-template/0.41.3/consul-template_0.41.3_linux_arm.zip"
    sha256 "6874bc5aad32e0ef0f0f66a770bca9a28d0c060080dd1a63f9d1e0e0e6526112"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-template/0.41.3/consul-template_0.41.3_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end