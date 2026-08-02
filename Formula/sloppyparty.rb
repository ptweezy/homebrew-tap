class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.23"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.23/sloppyparty-macos-arm64"
      sha256 "845f8ed0a2aefb773d81a0b023f2be86d5ace5fcd2f9863777e9779bdd0f4412"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.23/sloppyparty-macos-amd64"
      sha256 "39c135de18cfb36fbd090ad8bafed3b317cb1bcacb6eccdd95d4dd3988627ea1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.23/sloppyparty-linux-arm64"
      sha256 "67159faaa4eae1a9218758b136d5066729f467d106cac6e79bef666287229755"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.23/sloppyparty-linux-amd64"
      sha256 "aa0c50c914b441b4a609003f4aadab09d4458d09207ba77b8847dc198e6eea36"
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
