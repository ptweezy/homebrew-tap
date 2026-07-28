class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.21"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.21/sloppyparty-macos-arm64"
      sha256 "a4adb0e665a7345a49dcf2267b6c34f08c604d35b791ca21013d4b8d0cfd5efc"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.21/sloppyparty-macos-amd64"
      sha256 "807661df11b5c99bbc63947e9959297e5889fc1861e723acebe923dad1c79ec8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.21/sloppyparty-linux-arm64"
      sha256 "a7d8e84a8f4b0f72643fafecf4ebe662760ffac5f85905ce309044fa9b86219c"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.21/sloppyparty-linux-amd64"
      sha256 "deb1b7e01e001124123ebe6fa46273b7072eff1a05add686a4ca08d9483f3e8b"
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
