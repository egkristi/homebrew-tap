class Raven < Formula
  desc "Local-first RAG engine — fast, safe, embeddable retrieval-augmented generation in Rust"
  homepage "https://github.com/egkristi/ravenrustrag"
  license "AGPL-3.0-or-later"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.0/raven-darwin-arm64"
      sha256 "deea290a53ef9cf0a15bc9094863f12fd35dbd11249a8d35b24e33c705f9430b"
    else
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.0/raven-darwin-amd64"
      sha256 "c058452c66357e84a488ac1fcf09abf86dfdfd2251da6520e5271b1379748e46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.0/raven-linux-arm64"
      sha256 "508f8a57c8311a806f114c4dee1ac2fa5248b61f39db410aba09bca52d71fd64"
    elsif Hardware::CPU.intel?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.0/raven-linux-amd64"
      sha256 "2faa23e54f8759ab8ea9d1c2e37afd59d0106c9654120616cc710379575e6d87"
    end
  end

  def install
    binary = Dir["raven-*"].first || "raven"
    bin.install binary => "raven"
  end

  test do
    assert_match "raven", shell_output("#{bin}/raven --version")
  end
end
