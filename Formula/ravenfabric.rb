class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.21.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.21.0/ravenfabric-darwin-arm64-cli"
      sha256 "214efaf74333cd277eab809c1f87daf7923c89526c5af0344a373c88af9e458c"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.21.0/ravenfabric-darwin-amd64-cli"
      sha256 "f496f2f0e10c8018fbf5417ac2f37b120a71a6ce059e58612c3d75f51302f0b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.21.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "348f3e9d33cd5d23220fa1df207c33d061beb511fb8f01a7d9b4255a8059ba61"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.21.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "335f20dfa3d6081d0bca887e65f81c8360e34464190b3fcb2248b886b2c5b1e3"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
