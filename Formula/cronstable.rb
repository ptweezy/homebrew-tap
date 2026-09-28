class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.58"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.58/cronstable-macos-arm64"
      sha256 "02fcb51272050231509b5f5c9b2f2d29a4bc4e53a0a9f91f8702c8f35b19554f"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.58/cronstable-macos-amd64"
      sha256 "c807eb88ce7a10ff82cff899a7c0e03b544def736c99951da3f6a9a792df7e3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.58/cronstable-linux-arm64"
      sha256 "abf176efbb77eeedcd55c716ddd818aee92bd857edd1d4439e55cfb8f4ccde1c"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.58/cronstable-linux-amd64"
      sha256 "5e25962a3c6f68d47a33d4b9c423bddbacdad89f41449ddbdce70b5d8426842b"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    # The release asset is a single self-contained executable; it is the only
    # file staged from a non-archive download. Install it under its plain name.
    bin.install Dir["*"].first => "cronstable"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cronstable --version")
  end
end
