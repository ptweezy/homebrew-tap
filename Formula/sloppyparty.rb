class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.26"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.26/sloppyparty-macos-arm64"
      sha256 "dd45861624031eac0efcaafb7a798a8399ca81827adca2613db6a6632fc246aa"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.26/sloppyparty-macos-amd64"
      sha256 "1461c330d771bed6a449f2c11d4371e21fb8dad3a1e7b7f9072b3b2c52a2a471"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.26/sloppyparty-linux-arm64"
      sha256 "6955faf3970e244999bc4564e0ac1fc39b8cbf420a5da2c88c7713d605c0152c"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.26/sloppyparty-linux-amd64"
      sha256 "5425f0a231fa1d64f5726c0a64a036f1b3371e24f933dc021dae98c85ca2bfb1"
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
