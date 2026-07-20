class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.25"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.25/cronstable-macos-arm64"
      sha256 "8a1ded3f7c8636a04e28154a2abc30cea50437b45d6cafcaed4f8846e59c69bb"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.25/cronstable-macos-amd64"
      sha256 "4d87541fe4a37f2d50a83b8a5800f373632ae4167eb5dd155ab79ee695072913"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.25/cronstable-linux-arm64"
      sha256 "cb5225a88c3949ab145ed366264526bfa3647987ed20c2ec3a425c34442535d5"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.25/cronstable-linux-amd64"
      sha256 "df06b2704026da88bed78d6c68deab88eb1645352ae4fced4997eb9330060497"
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
