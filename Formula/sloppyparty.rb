class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.24"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.24/sloppyparty-macos-arm64"
      sha256 "08770453d08df447259704d4f7e6d5ddd82ab6418e35f1968e1006956c9a5b3c"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.24/sloppyparty-macos-amd64"
      sha256 "fd6c81cd220e3d71fd82af7bc6dd84ec4ae891436b00cda206c808e3ddada390"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.24/sloppyparty-linux-arm64"
      sha256 "057388cb012a100cb1c630d80e2c3428e6a4ec3a4d20c1c6c216e30c0f7b9a77"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.24/sloppyparty-linux-amd64"
      sha256 "1c0c6328972d9a432021f3703f61633e91f4e30ccf5ceb2647b07b66bce7b751"
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
