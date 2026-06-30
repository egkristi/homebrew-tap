class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.3"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.3/ravenfabric-darwin-arm64-cli"
      sha256 "25b49153c3d8bc0d574672b18ee45af4536e7b0bee546bb1f2fb2b41e419dd4a"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.3/ravenfabric-darwin-amd64-cli"
      sha256 "ad9aa385aaa9a80a2795199bd90342db2c6c3057f8b0896837311a5d327f716f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.3/ravenfabric-linux-arm64-musl-cli"
      sha256 "fcb6e4458319b8b16a04cc7deab9bcfe65ad081b4488f3b69c4ac2da7e1cfd5c"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.3/ravenfabric-linux-amd64-musl-cli"
      sha256 "066aa92d183b615847846ea6ca773709007a077fd7d2746c00696ac721757311"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
