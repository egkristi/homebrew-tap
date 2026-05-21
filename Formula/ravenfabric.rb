class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.20.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.20.0/ravenfabric-darwin-arm64-cli"
      sha256 "3408c8d639db73fe2e2897004af0ecd891e606acbb187bfb767e154d7d798e22"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.20.0/ravenfabric-darwin-amd64-cli"
      sha256 "179e182af748c5cfcbdeea28a1524e3d14a92ed44c7b935ac3690307c0ff7612"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.20.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "fbf697215f3b2490025edbe69820629ab8309566981265c1aea6b48a723b421a"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.20.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "56720af89b2db281ce33431596ba136b18c353f94b596251eac85c7bc4b2f65b"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
