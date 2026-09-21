class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.55"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.55/cronstable-macos-arm64"
      sha256 "0aba3b5c91de18f801f6f67d4a02f5ec6ab9acc5e7c0cc8ea39b5221b958b8b6"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.55/cronstable-macos-amd64"
      sha256 "ee9be530658efd6d8011e7626b4b6e45a319c0f79dbd35624f3c7e4de8c777a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.55/cronstable-linux-arm64"
      sha256 "b2e1ee49bcb8096f4083842a83af640afa38da4a244ee376b4266f6f2ac16cb9"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.55/cronstable-linux-amd64"
      sha256 "54bc43f0373997226e045d9670f84df829681999c8519dbf1cff69a593d6c900"
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
