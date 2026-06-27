class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.25.3"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.3/ravenfabric-darwin-arm64-cli"
      sha256 "22451d2ec36e1fc0c1969a8dba6a1b4fc56965fd3a752ef98ea8bb94b488d20f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.3/ravenfabric-darwin-amd64-cli"
      sha256 "15a4c48ce1495547dde2d5af3b90cd4046f752b8655d6940ccdaf72afe33f826"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.3/ravenfabric-linux-arm64-musl-cli"
      sha256 "71dd0c3cb42958276c74d791f109d0b8c28be7fc67aca6bf20dc5756fdca7757"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.3/ravenfabric-linux-amd64-musl-cli"
      sha256 "8092c756ac4cc4b38f62533b432a4649dae5d2b918b4b234e9fb45df4a040e6c"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
