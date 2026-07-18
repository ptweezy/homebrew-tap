class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.21"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.21/cronstable-macos-arm64"
      sha256 "01760773cd1fb07929f08d13a7b338b74375d3bd30d017a54a8ed86585883c27"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.21/cronstable-macos-amd64"
      sha256 "0e114eb2dc77ad0756c92ff988f88929a2fa3f4f7ab47da4c9a7ceb743a66853"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.21/cronstable-linux-arm64"
      sha256 "5c111e4f650be27f1ed1ebd8af1085b30f8c67597f63cbb6e385801f3156c2fc"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.21/cronstable-linux-amd64"
      sha256 "8a0d2a1b0952c4f855d378892ba09b8b6f5845ea0838606fbc373917f1d2fadd"
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
