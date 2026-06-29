class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.25.4"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.4/ravenfabric-darwin-arm64-cli"
      sha256 "61f244d2c078f198917a5947ba009d70bbc46ce85cb585d71a260f9bd25a5fe1"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.4/ravenfabric-darwin-amd64-cli"
      sha256 "01671e534217ae298d266e7be61a5b19e22415bdd8c829689df4328e797b4f94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.4/ravenfabric-linux-arm64-musl-cli"
      sha256 "15d2db14f04d759a618a8d98d84de3f1255da96c7d4d1bfbfd44da4a6bb0dd62"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.4/ravenfabric-linux-amd64-musl-cli"
      sha256 "be59a43d312c313ccaed4527e5783fcaf6ed4dca77c6992becb89bf7f0f4fe87"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
