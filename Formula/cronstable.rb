class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.17"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.17/cronstable-macos-arm64"
      sha256 "8108217159c486706e18dc079c448df77b19195bad729c8e543c7cd2526dc781"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.17/cronstable-macos-amd64"
      sha256 "28409c4e53dcca4946b4601b1e8bc4584cb5e1be2d35cd4b97d42388fe2be892"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.17/cronstable-linux-arm64"
      sha256 "272f0447c890ea16878b7343f9d2804e3e64bfa0ed8f74a4ca6831f14e424597"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.17/cronstable-linux-amd64"
      sha256 "5d740a1b6337db37f6a2c661de5a531eade04b41634b79e708b0b8887efba05b"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    # The release asset is a single self-contained executable; it is the only
    # file staged from a non-archive download. Install it under its plain name.
    bin.install Dir["*"].first => "cronstable"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cronstable --version")
  end
end
