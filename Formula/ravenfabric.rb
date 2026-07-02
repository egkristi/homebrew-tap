class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.5"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.5/ravenfabric-darwin-arm64-cli"
      sha256 "a4b69e8eb034aa7bdc46c1c5a30b08a83bfd5e0143c9b0a6e89bfff824a1566d"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.5/ravenfabric-darwin-amd64-cli"
      sha256 "0eca678a391ac7c4fe1757b698ab51e144f32a09d29c1ca39b9e6a97e3be84ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.5/ravenfabric-linux-arm64-musl-cli"
      sha256 "da126b08170d71064b07d7aef5cb4ebee9c6a02075e152c2a20907acfbf92c3e"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.5/ravenfabric-linux-amd64-musl-cli"
      sha256 "df215dde0929fecf8a0a1384d9880097d341a247d8a02d151f9745352347fece"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
