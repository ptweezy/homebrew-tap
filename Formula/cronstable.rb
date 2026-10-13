class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.66"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.66/cronstable-macos-arm64"
      sha256 "c823076ac25aa35d1f2663f2cf4ae94c5cd98f932ac3b8c76e9dab28a7b7731e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.66/cronstable-macos-amd64"
      sha256 "897b928326a09e2043a8ac82693f3a6639b8fda55c2efabe2db6efe46eee7901"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.66/cronstable-linux-arm64"
      sha256 "7140a34e9fd7d567465aaced942126bb8673ff4f57c433fbbdc506188200ac8f"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.66/cronstable-linux-amd64"
      sha256 "2787bb46dcc65d3f69ebb841fd3f87a5176594f28305d518c16edcabd43b8fa9"
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
