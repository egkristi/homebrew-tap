class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-beta.3"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.3/ravenfabric-darwin-arm64-cli"
      sha256 "044a9bc5dd631588b9ad454e30e0a5a3327c9e5ea399434b37fc05ecba09db5c"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.3/ravenfabric-darwin-amd64-cli"
      sha256 "0b2049ff5290579fe8bc6b52fd71ed5ecf607d433bb3ea6782d18eb4c6acd787"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.3/ravenfabric-linux-arm64-musl-cli"
      sha256 "5bfbbc16175f5f64dab736fb3b30a940e4762b36a977c85ecf53ee9660e5c5db"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.3/ravenfabric-linux-amd64-musl-cli"
      sha256 "e6c768240da5803d456edd444e2652282df32479784b7e4ae0bcf891f6a9331d"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
