class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.32"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.32/sloppyparty-macos-arm64"
      sha256 "23bfc6452efa9f1b365a76fb829f4be4624ae0be5963b131e6233cc6be641a62"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.32/sloppyparty-macos-amd64"
      sha256 "29624740792486f1aa54ec4e45fcc8af7a447b4af8ec9398625bbe882da63739"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.32/sloppyparty-linux-arm64"
      sha256 "c30c2fc67c97085dd56ba939ca475e5c5ee131bd134c9292c825a14e718342a3"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.32/sloppyparty-linux-amd64"
      sha256 "7eb42a0774ed159ddb63870b1fc9604b847504a5762a371924e12887e74900c8"
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
