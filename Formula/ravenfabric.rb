class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-beta.1"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.1/ravenfabric-darwin-arm64-cli"
      sha256 "da39e2e9f4086816b9b9c84437fc0d53f7030704091018f09aeeaa0ff812014f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.1/ravenfabric-darwin-amd64-cli"
      sha256 "b6d1164c60a8cc41225f269ea899c790ceb55dc5f49a40e0c24505249d6d1e22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.1/ravenfabric-linux-arm64-musl-cli"
      sha256 "3a68ae6656c07787aa740c47cdb2e5144578f5dd3f81e39e0fb8c5527f158dab"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.1/ravenfabric-linux-amd64-musl-cli"
      sha256 "1d611091f5f2292339c4769df83ddfd39e89469e222561eca99b63771336705d"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
