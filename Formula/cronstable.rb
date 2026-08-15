class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.41"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.41/cronstable-macos-arm64"
      sha256 "6a2dfd3bfadd8d8d8e0dc9c783804f0941b0a7724dfc5bb3abdf88fd095d3695"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.41/cronstable-macos-amd64"
      sha256 "aabf2f118f8603afc97a167d1948e3441b9232ed30f86dc157e8168ded316e97"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.41/cronstable-linux-arm64"
      sha256 "194e99d319d8b60e10a735420a51cee15a84b5d96690a9112aa9c01c61e44d6d"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.41/cronstable-linux-amd64"
      sha256 "f05391449e31973df1658db64e10891af4b20172c4d234cb9ad7d9b58fedf991"
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
