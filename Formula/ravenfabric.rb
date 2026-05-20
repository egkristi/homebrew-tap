class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.14.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.14.0/ravenfabric-darwin-arm64-cli"
      sha256 "08007a1fda11c12916821b85c0992493848258e8e2da00789b164011e9993545"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.14.0/ravenfabric-darwin-amd64-cli"
      sha256 "d62ff7e0f24d26b7cadbda51050ee53d3223bbfc603344cc9b4b2a4a9b84c60e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.14.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "aec5a35384312bbe5e7c47895d6cfae7c261d2486185ec1421b1cb85c18bf892"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.14.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "1a6fe72c70766976b668880a945238c09f59b778e1f0951c2ad8a9c06719d959"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
