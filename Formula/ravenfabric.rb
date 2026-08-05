class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.7"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.7/ravenfabric-darwin-arm64-cli"
      sha256 "e35cc88c7d5199a34501a74de53898a9cf8673834f7c60261ff8c27daa528ec8"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.7/ravenfabric-darwin-amd64-cli"
      sha256 "48ac039f57d3a817d3f48946828ebba7b7518426118c258b1df4c62259e7b1f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.7/ravenfabric-linux-arm64-musl-cli"
      sha256 "e4b2ea0aac4d66e459a5c1903db6a3a5daf77fc80fdf87faac987b048a07e376"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.7/ravenfabric-linux-amd64-musl-cli"
      sha256 "18aca1d406a82ddeca9a986dc1fc57ac74ad9b935b89f591fc1e3eda69328c27"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
