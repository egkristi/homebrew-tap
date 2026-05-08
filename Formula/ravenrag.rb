class Ravenrag < Formula
  desc "Local-first RAG engine — fast, safe, embeddable retrieval-augmented generation in Rust"
  homepage "https://github.com/egkristi/ravenrustrag"
  license "AGPL-3.0-or-later"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.1/raven-darwin-arm64"
      sha256 "6cfdac9a0799855a7343640457d5ed558cb67b77fba99954dc839c03cbcda60a"
    else
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.1/raven-darwin-amd64"
      sha256 "d048c33f5b736937768f82b970892bf7e0a1d3c7bb5f3607a57ecf98ba68b9f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.1/raven-linux-arm64"
      sha256 "20a8a2d90de6ca301cf689e1eae4790f854f52100746f09c12c57c828e431964"
    elsif Hardware::CPU.intel?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.1/raven-linux-amd64"
      sha256 "544993fa6cd713603917eed8119550b8f40364c51c096b6961d601776d848539"
    end
  end

  def install
    binary = Dir["raven-*"].first || "ravenrag"
    bin.install binary => "ravenrag"
  end

  test do
    assert_match "ravenrag", shell_output("#{bin}/ravenrag --version")
  end
end
