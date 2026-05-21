class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.17.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.17.0/ravenfabric-darwin-arm64-cli"
      sha256 "c686bcf1e8d2379f4e1b161aae77164722871a10f10b7674658b7d8a057a7e5a"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.17.0/ravenfabric-darwin-amd64-cli"
      sha256 "ccd8bcf9a4c692c8c373182eebce51c4331686a7760ab1a996afc98a2aae82b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.17.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "4d2cd23563fc7ff038e4ab4d3f5a55e74a50861db161de5198f32537cf42d2cf"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.17.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "a8bde391cac0253401946d360777b6702bb1201febc407837f4815cffe94cfdb"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
