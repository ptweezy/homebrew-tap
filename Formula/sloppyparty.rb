class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.30"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.30/sloppyparty-macos-arm64"
      sha256 "4d6b58f54adc954faa63ba51f6dbf6915b896dc336aae5c158e0cf74137af7fe"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.30/sloppyparty-macos-amd64"
      sha256 "cc65bf5ea8ad9d14509f3b2e792e4ec54ea09e861b95c7ddaa89c7705f306a8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.30/sloppyparty-linux-arm64"
      sha256 "7df8e65581e710be286c74c2b5e77cb8dc4083649391e9a5e81a125eebece7f6"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.30/sloppyparty-linux-amd64"
      sha256 "ff77b8c01422f0687115e2228f86063c0c254dd836882a43dbb8b1afbb48ea4b"
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
