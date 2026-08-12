class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "1.9.11"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.11/consul-dataplane_1.9.11_darwin_amd64.zip"
    sha256 "bd46773f332b9f18a7fac97d4ec7d5cb3ec6792faf9216e233c54e20b16a2a72"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.11/consul-dataplane_1.9.11_darwin_arm64.zip"
    sha256 "4152a06a950550ac5118aaa0c6dcf1e8acd2038e8c8358f5863e9512c36ce9ba"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.11/consul-dataplane_1.9.11_linux_amd64.zip"
    sha256 "3e1b5312228af6a8d7aa6e79f4969c908d1517987e3e30f8f937d46add4e93c5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.11/consul-dataplane_1.9.11_linux_arm.zip"
    sha256 "f75b3189c48499d6702bdcbb19550991e6be89478e7c1eb70894a507cc853598"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-dataplane/1.9.11/consul-dataplane_1.9.11_linux_arm64.zip"
    sha256 "5ad6bc0ed7526a039aec3ec4a223acf6b562f7e139a4c8c92ae16f92da056acf"
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