class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.28"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.28/cronstable-macos-arm64"
      sha256 "1bc7d0b7f64cd9dfd4ea71b029ed1b8b9da12e994f64bef8debe6e2ff30d669c"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.28/cronstable-macos-amd64"
      sha256 "2b60a958f4c210993e2c88ec6d10fa7a144c894d4375ff81d6ca525932f98fe6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.28/cronstable-linux-arm64"
      sha256 "29a33e5a20243dc88b88d0152aae0ac20d1a355fb758d6f0838aca1d72722ef3"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.28/cronstable-linux-amd64"
      sha256 "6b8db456e4d4b1012459c4ecc44b109279802ff2afa9f88b1a8f009935a994d7"
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
