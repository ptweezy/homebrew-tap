class Cronstable < Formula
  desc "Modern cron with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.61"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.61/cronstable-macos-arm64"
      sha256 "a1dd9bd8817f8e7068f8dd07a7a8c8e9309ee9a57f0f1a2fdd00031ba88250ef"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.61/cronstable-macos-amd64"
      sha256 "4a12acb524ff31531b0004fdac4f198aeb124c12659dcc14323045d6a6dbc935"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.61/cronstable-linux-arm64"
      sha256 "248f9aff4ddd6fdd01646b467e5c5b43f0458a44331e80a35d9390908f23726f"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.61/cronstable-linux-amd64"
      sha256 "b80da4f8fa461211cbc7986de5176ec6bf6161cbb3dababf9a2fce4e95074ffa"
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
