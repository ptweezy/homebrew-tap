class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.9"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.9/sloppyparty-macos-arm64"
      sha256 "010ef5f7982689869acfc7f612cf77ca305f96509edc28a2d7434d23495f6080"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.9/sloppyparty-macos-amd64"
      sha256 "cccad71c18563fac100b8f7849562d98704ff60d8e99ff94ea72c0d09f132d7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.9/sloppyparty-linux-arm64"
      sha256 "512380db4c54b2def227d58e3926307b2523cdbcf25c05cb585e3449e38893e1"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.9/sloppyparty-linux-amd64"
      sha256 "30a5707f2c36d55f390a4a35450c16fefa4bb8357d1ca86d1b9182068ee8f54b"
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
