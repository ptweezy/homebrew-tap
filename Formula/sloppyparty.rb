class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.5"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.5/sloppyparty-macos-arm64"
      sha256 "0fadb7aa2d2c7e1025d871887458e56757ef8f19766a5a9ec9abf095b3b5fd2d"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.5/sloppyparty-macos-amd64"
      sha256 "57d606f4961d4519f48566f386d535e45e4467b146af7ef778dee6ae440fcca4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.5/sloppyparty-linux-arm64"
      sha256 "8b4986380b30763da7a7176f56b3823ba2d24b9bcc7253945081dd8136a59367"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.5/sloppyparty-linux-amd64"
      sha256 "229f8df9aa139e54f0efe179d76c03b90f6a14b9cf06b70b534f25b58cf50c4f"
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
