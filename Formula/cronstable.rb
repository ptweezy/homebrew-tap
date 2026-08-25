class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.47"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.47/cronstable-macos-arm64"
      sha256 "fc102c660bdb80cd0a004a5c171e48cf3d7b3c3c5cfaf607a18c8f963a9d544e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.47/cronstable-macos-amd64"
      sha256 "ffb6e323d4b8f14acd9a7e1f35a257d2a2d5f38be6cd47b7dc154b2e4443b7a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.47/cronstable-linux-arm64"
      sha256 "e578ca98c016da9a9bfe309d45387659579fde187bebf409797d77cd482dce3a"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.47/cronstable-linux-amd64"
      sha256 "2f6ce8b275e8db23e084718546918e5beaab5ec450cd0aec5b0b851f63503e38"
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
