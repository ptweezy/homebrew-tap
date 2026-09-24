class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.57"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.57/cronstable-macos-arm64"
      sha256 "5c1bacfc86410718567d49addcbfa04c5d9a5733edfa8b05fde4e7df0e1e4624"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.57/cronstable-macos-amd64"
      sha256 "24e819ca98d926bcde6d7a05f3101be193f5ee2b9f36e245ba0809a9b8c64d5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.57/cronstable-linux-arm64"
      sha256 "9ac44b26da48dbbcbc84c6293880be9e2713d1de43438c68f726b4cc6974d740"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.57/cronstable-linux-amd64"
      sha256 "a338a4a08b75b1b76a95945ae27467c35111d9722a8c036c7658ef6c9499b76c"
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
