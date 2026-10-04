class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.62"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.62/cronstable-macos-arm64"
      sha256 "54d31d83694baaf2fd4e7e93896ed290500e78f8446d93e4d28bf470baf5c517"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.62/cronstable-macos-amd64"
      sha256 "3637bbde4e8b5d97e17cd18f0e783b59caa5807e5e72948ca6d8f71341223a2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.62/cronstable-linux-arm64"
      sha256 "cae8944fa3c687b7398341020bd39b9a1e44c742bb6209e76ff81bb4a708bf5d"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.62/cronstable-linux-amd64"
      sha256 "6f65f5cb61d5d9fbec9074e96627142e717a011584d16a5527a0653fbe9c779b"
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
