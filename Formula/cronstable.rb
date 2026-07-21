class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.27"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.27/cronstable-macos-arm64"
      sha256 "8ea67fb9dbcb01ed76693b4100806d01cc0cd964e37924d506134456af3e7e17"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.27/cronstable-macos-amd64"
      sha256 "11e8a5736b5fe606c96bc30f3c3ff92dc72489db4a73676573ca136e7d887a38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.27/cronstable-linux-arm64"
      sha256 "9d6391f226b8bdd5cfcf22cf26deed31de0b5b2cd4a1ad9d6df6d66956380cf7"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.27/cronstable-linux-amd64"
      sha256 "2601676d5487049c5f64986744420bf9a721448b51daf8edb92d9b6598ca9e6c"
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
