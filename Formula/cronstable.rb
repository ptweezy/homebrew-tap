class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.38"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.38/cronstable-macos-arm64"
      sha256 "a03cb7c718e477951dad6df72fef09812570b69aa00e65ab907642e8346f56c0"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.38/cronstable-macos-amd64"
      sha256 "ef2a89b04ab8b5c8b15dc6a5f09253db8c06d50be60f7d03482828480dc87488"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.38/cronstable-linux-arm64"
      sha256 "5f48c3724ab961d593f3882fb40f60336fb916d415146461fdff0701c9058561"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.38/cronstable-linux-amd64"
      sha256 "91ff66950758d00a9d58ddf150fb490c98f82ac73072847ad91122e0d55b025b"
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
