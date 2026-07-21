class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.18"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.18/sloppyparty-macos-arm64"
      sha256 "835f7c4773e3dcd2340220845585a6af5474789116db4d4b9452c4b892820bee"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.18/sloppyparty-macos-amd64"
      sha256 "14393742dadd274ed22b285bf5c4417cb375fbb10fccd59b046a16099fbd624b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.18/sloppyparty-linux-arm64"
      sha256 "0ad929bbfedb61eec572df0a93f83e3ba81bb62f75f7eb773d35d3d0d11c149b"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.18/sloppyparty-linux-amd64"
      sha256 "b5633ad1ca892b579dcca9ee25a89b6b373848a33a8a1be6fd8feb1a214d12bb"
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
