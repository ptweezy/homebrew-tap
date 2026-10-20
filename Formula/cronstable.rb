class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.70"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.70/cronstable-macos-arm64"
      sha256 "b7be1ea9cab61feac74c71bea9f79891b21dadcda5220d5434a4541ebacf0e00"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.70/cronstable-macos-amd64"
      sha256 "dbc22586dad17fd24980392013f4e83f435f4c877b49c9971f58fffadb0367b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.70/cronstable-linux-arm64"
      sha256 "eb687b5a99d42a5444ee6c69f7b738828cc03d5845c8ca2dace15a1a58d01fbf"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.70/cronstable-linux-amd64"
      sha256 "a06b4ece3ef2b127dd6f3b23729b735468cb842952a3bce9aaf766a533692fbb"
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
