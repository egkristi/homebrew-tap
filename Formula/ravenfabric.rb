class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.2.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.2.0/ravenfabric-darwin-arm64-cli"
      sha256 "dcff48d0608273de13c193cec40378554dbc11c4efcfd2fb7f1c54ac3f9988fa"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.2.0/ravenfabric-darwin-amd64-cli"
      sha256 "8fb5c83e238c86ad072c1c3946d764f3f18660df062e6bc1804ae06629af2e06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.2.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "b0553f47a73a035f9c58e6a1d0091ce6facf3440260c0d8c99c25c37e1226960"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.2.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "471fef87a53edbed9f824b297c2b88fd5e26d5e3bea03957ee8c17410d229a0f"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
