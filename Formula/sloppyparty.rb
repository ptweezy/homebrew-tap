class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.36"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.36/sloppyparty-macos-arm64"
      sha256 "c6fffe251a12b1b3d3c99d0c72f66f93d20fd64fcb35b1853c77da4392339fec"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.36/sloppyparty-macos-amd64"
      sha256 "9b79d25c727d5d920f3ac23ed7c2ec2cb11aa744b94550d799ff77ea67843c76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.36/sloppyparty-linux-arm64"
      sha256 "8380b4fe6c2de67488047413bda65d1f81716bedd2255a5e6e78eae51a641e2a"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.36/sloppyparty-linux-amd64"
      sha256 "a94c3e6147578001bd00ddb801ff8782e124e7407948b41305af326704e42fcd"
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
