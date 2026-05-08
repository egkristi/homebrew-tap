class Ravenfabric < Formula
  desc "Secure remote execution and mesh networking agent — replaces Tailscale + Ansible"
  homepage "https://ravenfabric.io"
  version "0.1.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric/releases/download/v0.1.2/ravenfabric-darwin-arm64-cli"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_CI"
    else
      url "https://github.com/egkristi/RavenFabric/releases/download/v0.1.2/ravenfabric-darwin-amd64-cli"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_CI"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/RavenFabric/releases/download/v0.1.2/ravenfabric-linux-arm64-musl-cli"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_CI"
    elsif Hardware::CPU.intel?
      url "https://github.com/egkristi/RavenFabric/releases/download/v0.1.2/ravenfabric-linux-amd64-musl-cli"
      sha256 "PLACEHOLDER_WILL_BE_UPDATED_BY_CI"
    end
  end

  def install
    bin.install Dir.glob("ravenfabric-*").first => "rf"
  end

  test do
    assert_match "rf", shell_output("#{bin}/rf --help")
  end
end
