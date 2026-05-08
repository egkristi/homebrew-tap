class Ravenrag < Formula
  desc "Local-first RAG engine — fast, safe, embeddable retrieval-augmented generation in Rust"
  homepage "https://github.com/egkristi/ravenrustrag"
  license "AGPL-3.0-or-later"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.2/raven-darwin-arm64"
      sha256 "396159a0547a9eb982903510395e412bcabe93006c7e7ba677077b94f9021514"
    else
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.2/raven-darwin-amd64"
      sha256 "3f3a7ee9bee435763f58fbfecf3ac104883ee2261e8e391d1bccb06863da4adc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.2/raven-linux-arm64"
      sha256 "ef6ede2662b41470486e03a587f3cae4a9828fc4d96b1b6c1db702b45c584987"
    elsif Hardware::CPU.intel?
      url "https://github.com/egkristi/ravenrustrag/releases/download/v1.0.2/raven-linux-amd64"
      sha256 "6aad85b6f85d86a8d5ce1c19368450a841245125113644d666182abd4738cb63"
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
