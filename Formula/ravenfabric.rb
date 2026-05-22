class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.23.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.23.0/ravenfabric-darwin-arm64-cli"
      sha256 "50a78dd52e5a2a3e68a79ad930c1b06937303d5a31e488c7f0ab236035c8b2e4"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.23.0/ravenfabric-darwin-amd64-cli"
      sha256 "e6180097f7de355050f0aaf9b1839cf5ba5ed79b71bfdb47fd145cebc8c24c11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.23.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "86b47210657bd968f1bd8d569cb2c3330e32986e2b694eddff68377b6d0f477b"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.23.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "bd358750623eab2a3050a56cfe9994c269943d230049935bb70521e8cbf67604"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
