class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.21.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.21.4/vault_1.21.4_darwin_amd64.zip"
    sha256 "a667be3cf56dd0f21a23ba26b47028d1f51b3ca61e71b0e29ceafef1c2a1dc3a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.21.4/vault_1.21.4_darwin_arm64.zip"
    sha256 "c79012c1c8aedd682c68b5d9c89149030611c82da57f45383aef004b39a640d2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.21.4/vault_1.21.4_linux_amd64.zip"
    sha256 "889b681990fe221b884b7932fa9c9dd0ee9811b9349554f1aa287ab63c9f3dae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.21.4/vault_1.21.4_linux_arm64.zip"
    sha256 ""
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