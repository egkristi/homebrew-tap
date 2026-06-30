class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-beta.5"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.5/ravenfabric-darwin-arm64-cli"
      sha256 "f9e1e99b16cd52881d255178c33eed1134806f055518f051df694d73b90d0e8f"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.5/ravenfabric-darwin-amd64-cli"
      sha256 "94dc48e107a33ffa4ce80c5d63b51de483f9f7d657a44580904287a990f6f958"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.5/ravenfabric-linux-arm64-musl-cli"
      sha256 "40888a0e81c59cd5cc7c113bda7f25c00be440f4762b7f398c4cd4d45c663423"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-beta.5/ravenfabric-linux-amd64-musl-cli"
      sha256 "aec178d3dced99ebc690ed89f152aa874250c962abc9a71eda9ef04341f38efe"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
