class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.6"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.6/sloppyparty-macos-arm64"
      sha256 "685d405fd89d8ba71ea3bfba0f90f0f71e51003ccc0e760fb23f10545640c0ac"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.6/sloppyparty-macos-amd64"
      sha256 "ef424417702fa18d54e1b636696d3f17ae5d1ff9e3382d54366357cd9761afd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.6/sloppyparty-linux-arm64"
      sha256 "42b8c3ce11d0e1ca240e5e27e36bcb04b0fa7ca77fa9bcc583dfa9787f482222"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.6/sloppyparty-linux-amd64"
      sha256 "89e47c7eb8c87c3704104e92eb59ccb14a7e2d348d9e2773d6ab48f6b24b67c2"
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
