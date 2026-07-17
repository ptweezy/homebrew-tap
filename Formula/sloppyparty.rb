class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.16"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.16/sloppyparty-macos-arm64"
      sha256 "04f7808780811150d9556899709e9df6176ce46d8361f69bae5c7eb4e9f2d457"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.16/sloppyparty-macos-amd64"
      sha256 "1eab3414104f1b6a98b591824de01af55c990bf29c2b9e1c0678271f94f450cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.16/sloppyparty-linux-arm64"
      sha256 "c263e4f0139258155df832f9871a78655ea972423e5dde32658fb96c61845b8c"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.16/sloppyparty-linux-amd64"
      sha256 "8aa75119156d593699e3a5f4d008d231bcebd7f5e943cc6b666c0154f4a12475"
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
