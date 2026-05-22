class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.22.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.22.0/ravenfabric-darwin-arm64-cli"
      sha256 "dc601000a169b7fca3cdc39b734916f2fa4f0eb9f79fc28ceedd0096e4469615"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.22.0/ravenfabric-darwin-amd64-cli"
      sha256 "a4f3ddb594dbd6e83233e5d6c18ee7ce6e395e0d92e99ec8b90124e3f8299a2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.22.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "8648cf93283482a0f5bab22e34270b700e37599bda177c0fc17bf1a14123cf8e"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.22.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "98535d619fb5747ba6518f7fc0ab582b7a46abb40f307bcc262b78eba0df123a"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
