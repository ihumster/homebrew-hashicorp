class ConsulK8s < Formula
  desc "Consul K8s"
  homepage "https://github.com/hashicorp/consul-k8s"
  version "1.8.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.3/consul-k8s_1.8.3_darwin_amd64.zip"
    sha256 "f5eefcca1ad61c377cdcd8ebab68c5a32025043dab4f8d23818ef62c5537d57c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.3/consul-k8s_1.8.3_darwin_arm64.zip"
    sha256 "ef40113c4fb05f4c31494c3cb7de9085dcaca38d582f2d3ac5b82394839afa5c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.3/consul-k8s_1.8.3_linux_amd64.zip"
    sha256 "973d297e53990704c554cc2c5fb397ad0040a00c0d865a79a9ddde4dccd1ac5f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.3/consul-k8s_1.8.3_linux_arm.zip"
    sha256 "4cb86d8e189abe5dcdca424121c11d1525b252f26b5c67bb148f52ef68dfe52c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-k8s/1.8.3/consul-k8s_1.8.3_linux_arm64.zip"
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