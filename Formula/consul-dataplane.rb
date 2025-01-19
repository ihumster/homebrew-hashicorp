class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.5.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.5.5/consul-dataplane_1.5.5_darwin_amd64.zip"
    sha256 "dc09f356e71131d1c1ba0555f1d23b64a21e8ef2c87e6af975817b8eeea217d4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.5.5/consul-dataplane_1.5.5_darwin_arm64.zip"
    sha256 "9628c3ceea73aaf06d8ed0e67b69a1808610e61493899cac0b38443bc06bb3af"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.5.5/consul-dataplane_1.5.5_linux_amd64.zip"
    sha256 "b3cb4dca27d96585cba691084b5960c17c3a0eb1f662e8e3acdf4a597c57c906"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.5.5/consul-dataplane_1.5.5_linux_arm.zip"
    sha256 "137991cbfd4a5bf6239bd225b68dcc611cc5339bbe784b771e73e96399f2cda4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.5.5/consul-dataplane_1.5.5_linux_arm64.zip"
    sha256 ""
  end

  depends_on "envoy" => :recommended
  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end