class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.9.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.9.7/nomad_1.9.7_darwin_amd64.zip"
    sha256 "8f5befe1e11ef5664c0c212053aa3fc3e095e52a86e90c1315d7580f19ad7997"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.9.7/nomad_1.9.7_darwin_arm64.zip"
    sha256 "90f87dffb3669a842a8428899088f3a0ec5a0d204e5278dbb0c1ac16ab295935"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.9.7/nomad_1.9.7_linux_amd64.zip"
    sha256 "e9c7337893eceb549557ef9ad341b3ae64f5f43e29ff1fb167b70cfd16748d2d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://hashicorp-releases.yandexcloud.net/nomad/1.9.7/nomad_1.9.7_linux_arm64.zip"
    sha256 ""
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