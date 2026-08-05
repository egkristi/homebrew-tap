class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.9"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.9/ravenfabric-darwin-arm64-cli"
      sha256 "70f91f3dc92b0a5cc498ea9da1d9c89d81e2bf8c9fc16c490d2597e360bdcd3e"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.9/ravenfabric-darwin-amd64-cli"
      sha256 "936d2c24d52f46ee33edeca30368b0b89c28dfa2124d22b32b8febe3ff2616c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.9/ravenfabric-linux-arm64-musl-cli"
      sha256 "8a233d1bd8381564a9250050903bd3bfdf0eece5ec609f1448c2af1e04cc2cd3"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.9/ravenfabric-linux-amd64-musl-cli"
      sha256 "8bbeacb6063a61140fab15d133cc822941904904ed8a4891d303c1ee1cd04d58"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
