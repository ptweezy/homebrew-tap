class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.12"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.12/sloppyparty-macos-arm64"
      sha256 "1b0523ff55733bb2ee4820a328c44913d18020da8aec8f47327be9e0ce8d32f6"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.12/sloppyparty-macos-amd64"
      sha256 "0023d36fbfc8c6286fea62fd4939ed448a814e2376bc7d48b6815cf4a182cd01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.12/sloppyparty-linux-arm64"
      sha256 "69a07bb531673cc4eac44ed50ca548e5af22bfa6033fac3dd222c1d62599559a"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.12/sloppyparty-linux-amd64"
      sha256 "897be328bec16794d4ba0f6d4cb976dae6d5ffa3ab35a0eddb0405ddce6edbec"
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
