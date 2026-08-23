class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.27"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.27/sloppyparty-macos-arm64"
      sha256 "c9d768c7fd0362dbf88c41b11fcb7c59200d10de02fd116335b288337877f509"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.27/sloppyparty-macos-amd64"
      sha256 "4c4b685f5c34b166527b736a7cdc66d41b7bdbf5ce21129aff4814e258f29b08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.27/sloppyparty-linux-arm64"
      sha256 "87c7aa5cce785b90ed07bdd136f2c0621a815c0d1b001f8794dfff030d5dc9bb"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.27/sloppyparty-linux-amd64"
      sha256 "bf88d19ba0abb9d7848f8ebe81b55aa341f243965c33a77f9afac512a6afda1d"
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
