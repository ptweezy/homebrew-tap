class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.56"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.56/cronstable-macos-arm64"
      sha256 "be6d6ddf2747f482eb971bc6fa9c361e6836535baceff042571084f6fe01f858"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.56/cronstable-macos-amd64"
      sha256 "17c98b1bf8ff55f3ca52e4f24227f336a66dad79f246d2a88a9d343ceb8ebefa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.56/cronstable-linux-arm64"
      sha256 "03940911960dcc5090643c50212f9bc05983bce57da37d6e1edcff758fffef87"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.56/cronstable-linux-amd64"
      sha256 "a42868af744d9557141eadeeee3c3ba1f329a7a1df5582efb4b92d891c2123cc"
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
