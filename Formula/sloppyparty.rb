class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.38"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.38/sloppyparty-macos-arm64"
      sha256 "2c1fea8eb5d7028e3683cac5f1a8968980ba54fb8acb450be946fecbe198ed05"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.38/sloppyparty-macos-amd64"
      sha256 "77a254c2f43b5e5c1494f31531418966db5881cdb6915619c1e12dcf4f5837c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.38/sloppyparty-linux-arm64"
      sha256 "a0ca542ee7606fd7184847c9e0bb70bcb08a9e0897ef5c795601a8bc83941c33"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.38/sloppyparty-linux-amd64"
      sha256 "c25984286884de36c9ecd61595ed1527812453068dbee5fc817550378b0139aa"
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
