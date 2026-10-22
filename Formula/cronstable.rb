class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.71"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.71/cronstable-macos-arm64"
      sha256 "5c4c4b0474b57af2ebb731d0d4074bb5f1f1da8c00643d5c70a448864836a6ac"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.71/cronstable-macos-amd64"
      sha256 "145127aa6ab45487cac458dc992a5a12edaa96024a93601d1c227f681a52e308"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.71/cronstable-linux-arm64"
      sha256 "ed3f242e35f36e684369844451060bd5693620dbec134d53ff6d29276834aa4a"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.71/cronstable-linux-amd64"
      sha256 "36717e7eb193dca4de89ede529f42f9dfbc710fc53c9176d38a203c974bd3907"
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
