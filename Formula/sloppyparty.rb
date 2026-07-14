class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.14"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.14/sloppyparty-macos-arm64"
      sha256 "77083ddc171d0a59be42576e81dbdb6bd44eb8ce594d9435f114595e474eb833"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.14/sloppyparty-macos-amd64"
      sha256 "a7ce98c8440cd9ec962ce2103b26c98f10bfd0380143b6eca669905581c5aa1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.14/sloppyparty-linux-arm64"
      sha256 "8b7ae84a5ceec4bf80799cd6ce057901e570b4d8bd64d44c72f5c86e639be620"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.14/sloppyparty-linux-amd64"
      sha256 "210e299c706fd241e3090a3ce01019ccb98db70b53868d87d964526004bae90a"
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
