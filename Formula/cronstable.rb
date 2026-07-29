class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.34"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.34/cronstable-macos-arm64"
      sha256 "58c3ad6cd1bab52a846816569d64240065220736dfe999b1ebb0d708a5c7c03c"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.34/cronstable-macos-amd64"
      sha256 "d4a62b6e5720d7255f758595d1477495177c3676c102a1569e1650dfdca6846c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.34/cronstable-linux-arm64"
      sha256 "e2617e5332aa098208448bf494ff403cae9af8bcb3a2c1388c1c89147ed246ee"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.34/cronstable-linux-amd64"
      sha256 "e51ee6821c0a228ef8c2a384cb725487deda6a7eb220aa06339f8d88be773aca"
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
