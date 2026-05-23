class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.24.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.24.0/ravenfabric-darwin-arm64-cli"
      sha256 "1fb41f01605a1703f2faeed4f4231c3d8fc1ec505f2ad7a53a1125d3a266f14f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.24.0/ravenfabric-darwin-amd64-cli"
      sha256 "58818f5df01fe7510d349f782fac798f5b43202a1fe20856ce4b32b19efb6caa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.24.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "3b6919729f701fdf76713d06e6110cabf96f0b193e172429418ee066595ae743"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.24.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "cf527d54904cd7d5b5cfac625cc32792ae9403090f07bcc6cc65b4e858f45f8a"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
