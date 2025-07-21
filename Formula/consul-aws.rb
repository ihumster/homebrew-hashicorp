class ConsulAws < Formula
  desc "Consul AWS"
  homepage "https://github.com/hashicorp/consul-aws"
  version ""

  if OS.mac?
    url "https://hashicorp-releases.yandexcloud.net/consul-aws//consul-aws__darwin_amd64.zip"
    sha256 ""
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/consul-aws//consul-aws__linux_amd64.zip"
    sha256 ""
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-aws//consul-aws__linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "consul-aws"

  def install
    bin.install "consul-aws"
  end

  test do
    system "#{bin}/consul-aws --version"
  end
end