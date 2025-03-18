class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.4.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.5/consul-dataplane_1.4.5_darwin_amd64.zip"
    sha256 "df1eebc8f4773086b5147af416a16ca73e3dad4ff96659028bcf4544857d5378"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.5/consul-dataplane_1.4.5_darwin_arm64.zip"
    sha256 "c9b067108875ae12248efa932b37943356733718819483e0ee4d352a05d6c8d3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.5/consul-dataplane_1.4.5_linux_amd64.zip"
    sha256 "cd68add5ecdcab81f63d52b9d1ef7af4b3b56bb055189cffc911b7dec8be026b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.5/consul-dataplane_1.4.5_linux_arm.zip"
    sha256 "0ab413b7006d3a716401ea7078bbfb199a018414890325e7cca3bea22e6729ab"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.4.5/consul-dataplane_1.4.5_linux_arm64.zip"
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