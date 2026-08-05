class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.10"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.10/ravenfabric-darwin-arm64-cli"
      sha256 "bb7597470f12e2f8184ac73e984b338ae92029770fdabb9fa5575b3fd2274c14"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.10/ravenfabric-darwin-amd64-cli"
      sha256 "f684e43810f7fc4685adc85a93c8507355eeb8d1fbf485d94d52156d10f0adae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.10/ravenfabric-linux-arm64-musl-cli"
      sha256 "54f06f6ce5d524eb85c5854823e3ee590c1c69baf0e63d47af0d58fb4b4ad976"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.10/ravenfabric-linux-amd64-musl-cli"
      sha256 "8a37859f38791b76729a7a3f2e485638202f4b4e3d9def197b52b5a53aa9aa3f"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
