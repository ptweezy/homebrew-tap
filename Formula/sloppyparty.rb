class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.41"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.41/sloppyparty-macos-arm64"
      sha256 "947e81411322a56d2adc95e0d5a150914fbbf743036c232e435cfe198309afb1"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.41/sloppyparty-macos-amd64"
      sha256 "f13f0a946a62c972225f84ba9f4ee1baa3fad682c7dc2d52ae9cd5d73722319f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.41/sloppyparty-linux-arm64"
      sha256 "f5063d1a36058ee3f82e6f7d2465d0b8971a56af8c5b16a5edb31405c9753d04"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.41/sloppyparty-linux-amd64"
      sha256 "f48fc85a9d0584cba5a2a6b882baa3c20a1a81b9ba58d42516b3165253f8797d"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    # The release asset is a single self-contained executable; it is the only
    # file staged from a non-archive download. Install it under its plain name.
    bin.install Dir["*"].first => "sloppyparty"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sloppyparty --version")
  end
end
