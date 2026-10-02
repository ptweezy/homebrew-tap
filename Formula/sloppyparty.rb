class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.37"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.37/sloppyparty-macos-arm64"
      sha256 "adbff82da7f4f586cb5799738daf42dd16afd64b69f25786915d6ff3d4307311"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.37/sloppyparty-macos-amd64"
      sha256 "a5866bcb2f55b5d7e0b41ec2512e2a547ec423f6af40f96776312ed028485f58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.37/sloppyparty-linux-arm64"
      sha256 "2abc68a7e8a9dfaa06989bce5ce6fa8605edf3ac94f4ca18da1745bf2d62bed0"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.37/sloppyparty-linux-amd64"
      sha256 "58d73428774d19600649e067086254a83548a67d81ce0f2700c22301f70eb21d"
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
