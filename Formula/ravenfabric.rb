class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.16.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.16.0/ravenfabric-darwin-arm64-cli"
      sha256 "5bbac4e663ea404d089c1cf1247f43d8bdd64901e05f88eebf67f132e13908f0"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.16.0/ravenfabric-darwin-amd64-cli"
      sha256 "5b1368980ea6bc4a8e21b3a844e8dd7490e7d34da506f6090ba0e4e46f690441"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.16.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "c83b6d05b8ec976b8d7a8dbf3037cc9e687ae524bcddcb9776afce418d3b4573"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.16.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "258ecc0b9be1e905a9c1c473b2d23211774f12aed97a6b9052b69b32003ffc39"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
