class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "2.1.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/nomad/2.1.1/nomad_2.1.1_darwin_amd64.zip"
    sha256 "c63035fb9d8fa760189a664d7e25a1083d6f5dcf520060b454ace263f779ef0e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/nomad/2.1.1/nomad_2.1.1_darwin_arm64.zip"
    sha256 "5aa9e30a8649608b790daad92177a40e7ca0109b03205a587ede9850811d1a77"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/nomad/2.1.1/nomad_2.1.1_linux_amd64.zip"
    sha256 "073084f7690fdaea756ff1eff8b669b25c3a6c17778f19ae0c47606973ed3f39"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/nomad/2.1.1/nomad_2.1.1_linux_arm64.zip"
    sha256 "ed7222af2f9b924262a8c4e053688ad9e7a7c82fa9485d6d147261072b3b8d50"
  end

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  service do
    run [bin/"nomad", "agent", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/nomad.log"
    error_log_path var/"log/nomad.log"
  end
  test do
    system "#{bin}/nomad --version"
  end
end