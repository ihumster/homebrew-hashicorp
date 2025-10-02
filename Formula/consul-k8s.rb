class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.6.9"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.6.9/consul-k8s_1.6.9_darwin_amd64.zip"
    sha256 "62791dfc624de8ac11a79cae8aecec0c743293819e288d632bc3aee180c3bc7b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.6.9/consul-k8s_1.6.9_darwin_arm64.zip"
    sha256 "58ce2637064bfea7aa29b96f85d2bb75980919b5791dbd8734c5607c7c69af25"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.6.9/consul-k8s_1.6.9_linux_amd64.zip"
    sha256 "296db64d6a6a3473be249d575f3df3f4b0be988064218fb8e6d402bd8202f5ee"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.6.9/consul-k8s_1.6.9_linux_arm.zip"
    sha256 "e72c4a71a681edbda5276a2ad36bd6af0bcc463a336999cfc5818e52a20231b5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.6.9/consul-k8s_1.6.9_linux_arm64.zip"
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