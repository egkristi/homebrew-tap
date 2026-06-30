class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.4"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.4/ravenfabric-darwin-arm64-cli"
      sha256 "072b5759a20a6e95168cc3c276ddf18587804378671ab38d7afa748235d44d23"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.4/ravenfabric-darwin-amd64-cli"
      sha256 "7ba6ce3b096ff4dc0d3866ea4bfa71ebd14191f933baccd03a98ea78cb4605a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.4/ravenfabric-linux-arm64-musl-cli"
      sha256 "e8c24345f09aa6ec7eaf80d0761689a6e0edb2c16e138ac9cf76df194a3f7ede"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.4/ravenfabric-linux-amd64-musl-cli"
      sha256 "2a122ca074951f875e85f26bcf8be651aea5ce0b64723c7d380ecd3ad4cbc2fe"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
