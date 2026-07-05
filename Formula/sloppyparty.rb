class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.3"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.3/sloppyparty-macos-arm64"
      sha256 "eb5c26039e69952451be5794687ef020efdca29af179d7747debd52235f7c320"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.3/sloppyparty-macos-amd64"
      sha256 "a02540a057bb6bea18034a7129bc6590e7e8340e001f032d6e173f8f6bbfefa9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.3/sloppyparty-linux-arm64"
      sha256 "9e6f2076f996d8e9a926b0220a563d85e43151cee98d55d4fc1a04b78be0b4db"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.3/sloppyparty-linux-amd64"
      sha256 "e76e234c58886d5f8054efec7077e1abb070b72c4b2dfd48bb2e758a0fb7df9b"
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
