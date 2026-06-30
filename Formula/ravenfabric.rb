class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent"
  homepage "https://ravenfabric.io"
  version "1.0.0-rc.1"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.1/ravenfabric-darwin-arm64-cli"
      sha256 "4134c70db4aaf508c7065067a6baa59104f5926bc73040d8e399d73cc84212f7"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.1/ravenfabric-darwin-amd64-cli"
      sha256 "0d627a61dd22d84994292dbada22cdc76565990c74f8259e35457b9b7e153d55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.1/ravenfabric-linux-arm64-musl-cli"
      sha256 "9b10902f39ff66eddfc216311719e26eca4873ef62ee65179430ff422cc0e5e1"
    else
      url "https://github.com/egkristi/RavenFabric-Published/releases/download/v1.0.0-rc.1/ravenfabric-linux-amd64-musl-cli"
      sha256 "e90e5cd9c5e50f92aa31821d3757ffc2f1da5ab240dc0d809610579fd744a70c"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
