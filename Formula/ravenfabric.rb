class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.25.1"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.1/ravenfabric-darwin-arm64-cli"
      sha256 "5584db3732c33b68534ef37f6618fda0e2c0f161fa4a198bf8e56dcb072f7fe9"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.1/ravenfabric-darwin-amd64-cli"
      sha256 "0a8711568cbf5e7d904bf8ae933cf0c7d749aca0fca2acdbcf6978dd6ea4ed73"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.1/ravenfabric-linux-arm64-musl-cli"
      sha256 "bdcbcb29744a72489d261018fda81b5869888d3108dc1ed9ec06c467c2223564"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.1/ravenfabric-linux-amd64-musl-cli"
      sha256 "66635c2c19f0ae1b20e177d30d05a4839bb15ce95cb39b91d6d882cff7f72842"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
