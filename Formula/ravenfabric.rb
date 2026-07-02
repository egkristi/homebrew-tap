class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.6"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.6/ravenfabric-darwin-arm64-cli"
      sha256 "634e526f2b9cf3a2271a4a724b24f420db40979eb556c1e9825229b44baee08c"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.6/ravenfabric-darwin-amd64-cli"
      sha256 "3d0aa69e961ea9424e732a2a98af1a4c3c47fdb5a53d405019ed86136d99a3e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.6/ravenfabric-linux-arm64-musl-cli"
      sha256 "2d1ba45a9ae9db2ae94cf46487d2bab6ff0c2f2af88df5fbf14a68255b98d1cd"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.6/ravenfabric-linux-amd64-musl-cli"
      sha256 "b9a83a5ca4b96c28e6819cfdd6fa40c625c9a0e7004a62e24ad0c8a233f550fb"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
