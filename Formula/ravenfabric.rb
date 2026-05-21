class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.18.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.18.0/ravenfabric-darwin-arm64-cli"
      sha256 "04c76cad64930c954cd10214dcdc7b29952d4275dbab26feb6b43be4c64803a7"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.18.0/ravenfabric-darwin-amd64-cli"
      sha256 "207c448c4e6172059cc6ced73394f05fea900f52748dfdd0a1316fcfdaae57a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.18.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "067c5aedfe912a547556e79c8562601181a1d42f1a327262f8bc8f04508e1b88"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.18.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "ac4835df577b7e7eb90b4f996d3b237f80934db242ee0fdfd6cd57a1f663300d"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
