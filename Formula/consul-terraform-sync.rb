class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.9.0"

  if OS.mac?
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.9.0/consul-terraform-sync_0.9.0_darwin_amd64.zip"
    sha256 "8a2f3b848d6e42b4598df6b75161b4ffa3545e87a086ecb07abb3612738062e0"
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
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.9.0/consul-terraform-sync_0.9.0_linux_amd64.zip"
    sha256 "600051190f59e2caaa70cc47593ec7cb3a4f35eadc3573668bdcabcdf94ed9c4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.9.0/consul-terraform-sync_0.9.0_linux_arm.zip"
    sha256 "db2aa8c1b7c35d8942eaffb1befaf18a0b1269b43abddf4c6e4db9fc4894c522"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/consul-terraform-sync/0.9.0/consul-terraform-sync_0.9.0_linux_arm64.zip"
    sha256 ""
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end