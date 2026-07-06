class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.10"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.10/sloppyparty-macos-arm64"
      sha256 "24243f46b18346136c17c5f5d352621ecc57a7870fcab84075fe5e61a87bc777"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.10/sloppyparty-macos-amd64"
      sha256 "c8d3c17591a50bf7b309edd8a502a40b3574b9d85c153de1487c7298785ca6a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.10/sloppyparty-linux-arm64"
      sha256 "226345abdd599ea0b5c53b8ff241547d615b54c8ccca18981c6dfbec1b1e4abb"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.10/sloppyparty-linux-amd64"
      sha256 "57a5c3a9ec08e3f6f7322f27a8a6b205ab1b5e9f6ea0e5a3ecadc0d946196c06"
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
