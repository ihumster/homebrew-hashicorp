class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.18.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.18.3/vault_1.18.3_darwin_amd64.zip"
    sha256 "2459ba9cb8123e9b177e7e5d0b7c893779593d141d5bca7d24e21ad9edccfb65"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.18.3/vault_1.18.3_darwin_arm64.zip"
    sha256 "88c22964804781934da7192174c9fdd00e9973b57f1b0f27c255cf7dbe333bad"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.18.3/vault_1.18.3_linux_amd64.zip"
    sha256 "405ec904a45c2261e2c091640fb805bf5904fd2fe8a991ebc58d2eb64f9a269e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.18.3/vault_1.18.3_linux_arm.zip"
    sha256 "816df690b9240cf50828331012081b4221da4eecf30e1ce4d85053113138aab7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/vault/1.18.3/vault_1.18.3_linux_arm64.zip"
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