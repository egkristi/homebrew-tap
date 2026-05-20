class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.13.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.13.0/ravenfabric-darwin-arm64-cli"
      sha256 "890c40d5919e87f3fcdddbfa481fd0edd0466e30baba8eab5a1815ae34af61a3"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.13.0/ravenfabric-darwin-amd64-cli"
      sha256 "62686140c798814f020d60d31ad5948ebb530bd1d62f053332de8a9b81a2d4c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.13.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "847dd1fb20c143ceb4bbf533d405a8ae0a5b22de0fc64f24687b7f25228d78d1"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.13.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "cc8b49cb314ba43a223ea81e9c4fd6dddf19869ac5a440ea31b1fd56d54d47fb"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
