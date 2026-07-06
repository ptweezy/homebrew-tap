class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.11"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.11/sloppyparty-macos-arm64"
      sha256 "453dff5ad39275f2809bcf5c281c85a1080a51ea4a1021ea265ea8eb1eb1fffa"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.11/sloppyparty-macos-amd64"
      sha256 "37d1ac338ccbc2bc9f59695d25c9f9b0989287f2f149df762afb333430a837c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.11/sloppyparty-linux-arm64"
      sha256 "c926be2c98a3bc061568e51521e9ad29f2abefd9af873e1bd2ae47be3683c6e9"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.11/sloppyparty-linux-amd64"
      sha256 "ec6e53f4a7ff2adff7df251ca7be8761d4271244dd2ceef81e060426b4731713"
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
