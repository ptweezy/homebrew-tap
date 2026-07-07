class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.13"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.13/sloppyparty-macos-arm64"
      sha256 "d972783abc187b444ba3de1ec760a9486360f8e58c2b129ba9d2be814d6d3008"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.13/sloppyparty-macos-amd64"
      sha256 "aceb327b49bfc70555092d92eabfe1f59b12024625024adf330411bd5d2f661e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.13/sloppyparty-linux-arm64"
      sha256 "bd9987b2a70be25055b3ad9e90c940774bffe172b59688283a07c8260132aaa1"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.13/sloppyparty-linux-amd64"
      sha256 "a4cb4538b252a740af5a3ed744a38ebc3c57ace126b41af6ea16696c42ef91cc"
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
