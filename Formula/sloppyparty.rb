class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.7"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.7/sloppyparty-macos-arm64"
      sha256 "2ca5d71f361f9bc6cec14e1fe95226d06e485f6a171f6187ada97c7d0a8b32d1"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.7/sloppyparty-macos-amd64"
      sha256 "9a05e07dd821a2b8c7242f92f1f57e763906c080205c2d48f37deae0f7f56b72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.7/sloppyparty-linux-arm64"
      sha256 "5cd112a0b8531503ede70365b5c1faf8532d59bb2e38ba318c186054f43d5dba"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.7/sloppyparty-linux-amd64"
      sha256 "c333252548db89e21a7e9202e7d109c193b411964667fc565015532af55a3fd7"
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
