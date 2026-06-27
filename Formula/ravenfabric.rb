class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.25.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.2/ravenfabric-darwin-arm64-cli"
      sha256 "126fdf5afd2c71d98c916b98aafffc699f53d808022b29e170a2cb4b817f5650"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.2/ravenfabric-darwin-amd64-cli"
      sha256 "896b8ea2a996e056ecef0517812c99f95d26203499aa7726ea21947298e0576f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.2/ravenfabric-linux-arm64-musl-cli"
      sha256 "40b9e207e65c6a8620a867956558146811c2b0a6a411b506e49d9781835abb4e"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.25.2/ravenfabric-linux-amd64-musl-cli"
      sha256 "297c4bb813e8c35e77e23b929fe760c2a54f3eb8a827e0c675c72aaa0b9b6bff"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
