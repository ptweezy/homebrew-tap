class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.65"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.65/cronstable-macos-arm64"
      sha256 "bc23b228beea0b462866048c4c38f257396022b73af33e4758f5d0d32961398a"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.65/cronstable-macos-amd64"
      sha256 "b64c2e29b0e234dbc1dddaf93e681f2e194835ffaef723270f6afb559191d345"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.65/cronstable-linux-arm64"
      sha256 "e109454de599e0f27b80e7416ad16497b3f4f6c21b3356b47010dc0cef2029f0"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.65/cronstable-linux-amd64"
      sha256 "c19dbdbb2d9db72210e5b06295040976c06a2f68878a8de074c6cd6e1824e935"
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
