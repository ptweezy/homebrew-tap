class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.25"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.25/sloppyparty-macos-arm64"
      sha256 "392d71a2aefd399b6441055aa308ebe4696a7b1e8743b188f649b749a96919bc"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.25/sloppyparty-macos-amd64"
      sha256 "ccf603529c4ea851bad9e9399c8636784fdce0a747abf2bb69be8abe8458d9cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.25/sloppyparty-linux-arm64"
      sha256 "9b7571685558393660141db43b28936ec1d4fdec3ef7cbb731bb475033c3536d"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.25/sloppyparty-linux-amd64"
      sha256 "9e004b87b6b62983dcd1228d8f5ee9cb02e31edcd8b0020cf8f9274e5828880a"
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
