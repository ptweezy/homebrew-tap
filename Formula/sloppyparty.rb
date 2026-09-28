class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.35"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.35/sloppyparty-macos-arm64"
      sha256 "35f8cceb00c5fa3005817ab4485200fbe89eb076407ce0c697477275bc757268"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.35/sloppyparty-macos-amd64"
      sha256 "b64e13f45764de459a911d3bfe6e6ce4002e255161a9b51a4e63306c7a0f2af8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.35/sloppyparty-linux-arm64"
      sha256 "9f353321a8562836ace056ccb9e571e56378c26c5c6e40668b2b8e131e086dd8"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.35/sloppyparty-linux-amd64"
      sha256 "0543d6bc99b98e30a3f8756c5ac2c7493d35261be3c6747b3a6c5b728d81151d"
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
