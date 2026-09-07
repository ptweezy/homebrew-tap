class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.31"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.31/sloppyparty-macos-arm64"
      sha256 "16b8ac07cc30b41236bde7a5f1f7ec98c1195fe6a24ac94fe8ebe1aafb040bf4"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.31/sloppyparty-macos-amd64"
      sha256 "841582de8e5e44179aafda53e6236ecd54e4e3daceeefae39b9b9568d24fe41f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.31/sloppyparty-linux-arm64"
      sha256 "c8802d6e4a741b9ae4a6f948f4afdd9228d12924cd37dce3688542d3a8180910"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.31/sloppyparty-linux-amd64"
      sha256 "fb80e8d850f15c798f72184827696f7bb1aeec4f7bbef7bdea54a8be75e1085d"
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
