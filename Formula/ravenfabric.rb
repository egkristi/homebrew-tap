class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-beta.6"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.6/ravenfabric-darwin-arm64-cli"
      sha256 "e5d0565e5f0b62ff65b436720d881ff2391db3743b4c3a8b3da7151387899e3f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.6/ravenfabric-darwin-amd64-cli"
      sha256 "4ac0fea8e39fbc87601e6bb347bee930786b1e20987e82ae4d7e01478e07859d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.6/ravenfabric-linux-arm64-musl-cli"
      sha256 "1056d0e43125179c30fd7b60f40a092ecf9e6d32bb39641d19e9916a3518658f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.6/ravenfabric-linux-amd64-musl-cli"
      sha256 "5d4b22c78c4c1a54e56e71399039a0c99162502c923381ec8ed14edda9ff3755"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
