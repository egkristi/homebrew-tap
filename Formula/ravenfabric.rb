class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.19.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.19.0/ravenfabric-darwin-arm64-cli"
      sha256 "a3b0f44cedb94e14c0372b20b52c6b2a3252992f2954db48fc3acd9ec2278706"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.19.0/ravenfabric-darwin-amd64-cli"
      sha256 "6cb1f6c174a56b8b83fc7b30dcf8903dd046a9796ae7a9a7de9914bf31940034"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.19.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "44111a41356d9c52f10681fe4dde551a75623ca665e07bdf451f313389d3e2ce"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.19.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "7dd984e6a2ed1723efee303cf997c9ac8bf0b4c6fbe366d06aa08d1a8b4d8295"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
