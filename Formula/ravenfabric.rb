class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.3.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.3.0/ravenfabric-darwin-arm64-cli"
      sha256 "4db252793efb7c5e8eb15e59acb220a4353fbb32a8cb15a9276fae4bee2bf413"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.3.0/ravenfabric-darwin-amd64-cli"
      sha256 "43e43534e5f49477c84b25b5b5bc2fb23cc65d83c52dd0efb421d75d2beef0dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.3.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "30ee9579c3455faf1e67ab0772d2772f7a427b0dd2e54a798d5d3755a8e1a7ae"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.3.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "c031bc04a0c68dd1af378e4b67516b7bcff23dc9393e6358f14c9a2e84aff6d4"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
