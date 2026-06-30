class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-beta.4"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.4/ravenfabric-darwin-arm64-cli"
      sha256 "55d6fd83d9a49b02a2a1835930ff0b7d09e7817f7f6b881c82f9622f5b5f1582"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.4/ravenfabric-darwin-amd64-cli"
      sha256 "2d18c5722a4cff0c78ead9789179873e5a4a5a919a8cc54503b519d9c87989bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.4/ravenfabric-linux-arm64-musl-cli"
      sha256 "b3a9d89efe232aa602070d45a7a40b91305d4ee64fdc39f84947f6d80f03ba84"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.4/ravenfabric-linux-amd64-musl-cli"
      sha256 "8c8162871e797592a08b2af947e3caade4c04bde51d6b8475418146f1d6cf6a1"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
