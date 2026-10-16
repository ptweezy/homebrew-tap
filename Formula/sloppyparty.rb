class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.40"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.40/sloppyparty-macos-arm64"
      sha256 "c6de016ebc54e585cdc89154597518d205e2082df0d35d953597cc2f03157b24"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.40/sloppyparty-macos-amd64"
      sha256 "39f9d4501be21e53d923e3e87b42c4b7e65b48352716d74fa6dcbd5c25c420ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.40/sloppyparty-linux-arm64"
      sha256 "d67e921a5ff4a6bcc8ca87a823acba47df35b5ff1da7b0fab2fab89acd7c5f85"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.40/sloppyparty-linux-amd64"
      sha256 "ae320435a2d46d3e7a380ee86fae3df764e4f3494d7a0460cecaab78a19ff2ce"
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
