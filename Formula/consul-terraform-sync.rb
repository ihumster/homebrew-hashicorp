class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.10.0"

  if OS.mac?
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.10.0/consul-terraform-sync_0.10.0_darwin_amd64.zip"
    sha256 "bf1715dcbab1d8ec785dc7d36a4567b29e8facd32b3e65731848b8cca940346f"
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
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.10.0/consul-terraform-sync_0.10.0_linux_amd64.zip"
    sha256 "60368bf2402681870a9d5e324e51ba98c7c98ac902f790f5f98a91525b663e18"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.10.0/consul-terraform-sync_0.10.0_linux_arm.zip"
    sha256 "1b6a448273916ac0e45ddb8060da80c01970675fa1f487973880eb177f396656"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.10.0/consul-terraform-sync_0.10.0_linux_arm64.zip"
    sha256 "734451fe73705a6b2417fe18cc00e7be7c83688b68382891c0369389f09f9f4c"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end