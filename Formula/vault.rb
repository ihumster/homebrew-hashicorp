class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "2.2.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/vault/2.2.2/vault_2.2.2_darwin_amd64.zip"
    sha256 "57ce53e10b266d2c1c2c3646813e434777e9bddb4e5377e7e1250e85ca98a2f9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/vault/2.2.2/vault_2.2.2_darwin_arm64.zip"
    sha256 "75843ff0559dfa4d69bfde073f98caaa22674c27fd80446d092ad2069d7f25f8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/vault/2.2.2/vault_2.2.2_linux_amd64.zip"
    sha256 "5700edf139113609962fe371af7d2a53de8ecb720d545dc39b43de204515d3c4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/vault/2.2.2/vault_2.2.2_linux_arm64.zip"
    sha256 "78634c8672601ad1ca9b27f24e76c54224d12521c59ece957ab8d23976ddca12"
  end

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  service do
    run [bin/"vault", "server", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/vault.log"
    error_log_path var/"log/vault.log"
  end
  test do
    system "#{bin}/vault --version"
  end
end