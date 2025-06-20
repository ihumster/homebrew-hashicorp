class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.21.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.1/consul_1.21.1_darwin_amd64.zip"
    sha256 "4f9b7b55f268d792c70f47843a2598664bf55765d81c6224d4f5441eb6d54c0c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.1/consul_1.21.1_darwin_arm64.zip"
    sha256 "67b32dc6902f37037d8fb6a17c48bc454b1724fc2318ea0b8336578d5bd63cf5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.1/consul_1.21.1_linux_amd64.zip"
    sha256 "cf5b8d429c67d4e3c86e2f52eb3245ee00119a9a389f2af36a77b16b1e1eb27c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.1/consul_1.21.1_linux_arm.zip"
    sha256 "4f9faad99f0888eac6c127e50385af28b2b06e67d0f7c84662a66bf1079c0da5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul/1.21.1/consul_1.21.1_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  service do
    run [bin/"consul", "agent", "-dev", "-bind", "127.0.0.1"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/consul.log"
    error_log_path var/"log/consul.log"
  end
  test do
    system "#{bin}/consul --version"
  end
end