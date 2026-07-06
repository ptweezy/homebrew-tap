class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.8"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.8/sloppyparty-macos-arm64"
      sha256 "bf7d03ccd8d9ed011ba4be764b35d2fbe97eca30fc02b8a2d1e59a71834cff22"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.8/sloppyparty-macos-amd64"
      sha256 "a46c7a249954d90d8d2a8969aafaca8abb3fdef5d65d7b9b908dd237782911f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.8/sloppyparty-linux-arm64"
      sha256 "3cfe1dc3dd4c59dcb67b9f2b8d11e3a26f40e6468f4221860867d2c0ac24a95f"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.8/sloppyparty-linux-amd64"
      sha256 "ce8f7cbd211ecf493df34e80fce6c2c2ab68e218796a3df3a2348a334eb0a9b7"
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
