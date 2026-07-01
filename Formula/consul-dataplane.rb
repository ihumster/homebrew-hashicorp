class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "2.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/2.0.1/consul-dataplane_2.0.1_darwin_amd64.zip"
    sha256 "7b7856aa878493f2715c62a3a82cc624bec67c96f83561c8bc870f874a860c63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/2.0.1/consul-dataplane_2.0.1_darwin_arm64.zip"
    sha256 "0207b2781f2359e44af12d7796a390e5ad6e2fabb0c5346d6902996d657c47d8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/2.0.1/consul-dataplane_2.0.1_linux_amd64.zip"
    sha256 "96429a9dff7118f7cf168817867c5f30e2f69f6f6b4e4290911d0972add9aed5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/2.0.1/consul-dataplane_2.0.1_linux_arm.zip"
    sha256 "e302bdcf93a2e4a15852566a41d2bcc15788d1dcea48b12f01238ce20438497e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/2.0.1/consul-dataplane_2.0.1_linux_arm64.zip"
    sha256 "a4c424861a58649f803c33a6a96835bec60198579aa9acf5c9b55186a07cf832"
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