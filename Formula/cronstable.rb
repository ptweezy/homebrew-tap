class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.72"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.72/cronstable-macos-arm64"
      sha256 "e18f8ca9dbc425eeb54ad51d5c794edc6bc001afd6dd374202d420e4a2ae6c36"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.72/cronstable-macos-amd64"
      sha256 "37f846b7726a1ee952a2be601addba4e4cb03bab95fc0ce4188e63be294daad0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.72/cronstable-linux-arm64"
      sha256 "9bec1d293fe603a3c55b653ac02e7616abd4e9eb2be3e34c32922d1e0cb9cce9"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.72/cronstable-linux-amd64"
      sha256 "21878dd4b69bb84437b1b1b50949fff1370a80394f362f6962d8d74e25d6d739"
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
