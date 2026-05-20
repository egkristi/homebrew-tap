class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "0.12.0"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.12.0/ravenfabric-darwin-arm64-cli"
      sha256 "18fe4c3509c538ae7f6ca72a7c38ddf6dc0b1cecd018863fbe07df13d01cd100"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.12.0/ravenfabric-darwin-amd64-cli"
      sha256 "60d52368e9e7d12ea2869aa781ce0ceb9c9323d0a2296c0d58ff06d33604f9bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.12.0/ravenfabric-linux-arm64-musl-cli"
      sha256 "0593a390fe9dce35623930d76f81098446f2aa4382302f97a1549c23e40e32e9"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v0.12.0/ravenfabric-linux-amd64-musl-cli"
      sha256 "d6b332b200bab6dcfc0939f923284b257e108f8c017bcd9e3ff0fe6a2df18580"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
