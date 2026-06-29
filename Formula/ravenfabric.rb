class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-beta.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.2/ravenfabric-darwin-arm64-cli"
      sha256 "a1b5a08e812d3b1c6a2a9bf809f898d28342c37e1c5c4018609251a91b0f387f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.2/ravenfabric-darwin-amd64-cli"
      sha256 "fa5660816cb5c1fbf2087b93f0ee75deacfcf7233466031ae681c47197a80c54"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.2/ravenfabric-linux-arm64-musl-cli"
      sha256 "6ea80ab3705d28c16a697b1a78850b8db861d06836faebad8f1a6c0f0a558286"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.2/ravenfabric-linux-amd64-musl-cli"
      sha256 "2432762913f38a1be81f5aab3b935785254bd5ef4d8efda17aafde37b5d27a43"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
