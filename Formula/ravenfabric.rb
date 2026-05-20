class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.15.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.15.0/ravenfabric-darwin-arm64-cli"
      sha256 "e85c3a4e0d682076de8dab6dea30dd1ce0a0b4edd928366ff52368391b3a37d9"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.15.0/ravenfabric-darwin-amd64-cli"
      sha256 "cebe7dc00fa0230c2cd4fd55e9d93b5597a3b3c25c695f751bd8d4fcf8ff71a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.15.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "ff865bab98c97398a6d4ecef6dfbd9980a570e14ba1af080c792bec09ad8514f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.15.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "b2bc3f54d5c2ebb41817eb6bf1be3a1cac72a613398e71b3bbb32f1ad0513ca2"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
