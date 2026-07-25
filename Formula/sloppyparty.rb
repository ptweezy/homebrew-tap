class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.19"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.19/sloppyparty-macos-arm64"
      sha256 "060bc63c738259795ccf4ae7655a66d6a2cfe205ec2da5b32906fd85c6cf7b30"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.19/sloppyparty-macos-amd64"
      sha256 "6be7e090445e82ba7f4e9f32bed98f5ec96f8a25247f0977f45e2e77bdab335a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.19/sloppyparty-linux-arm64"
      sha256 "59106d30b261bac21c601767db2da7c2fdcde84f12e2aeb948bae88109121db7"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.19/sloppyparty-linux-amd64"
      sha256 "6e161a33ad2135c80c1fa7d7f0e029899971032f1b97eb35c126df5a5aa0c43b"
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
