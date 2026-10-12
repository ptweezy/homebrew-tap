class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.64"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.64/cronstable-macos-arm64"
      sha256 "7856046cadc3f2de29d42ea9e176b74ca3495329ac0c0be3263c67778117e47c"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.64/cronstable-macos-amd64"
      sha256 "a6944592519f54fe4d4401187046d06f7f09f1b7fdd0df551947e369cd76c2b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.64/cronstable-linux-arm64"
      sha256 "84bf0e8fa5de72838f44f38008801971a3c5d70d4dd8bd3d8ad34c7f464081f3"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.64/cronstable-linux-amd64"
      sha256 "21dcf9a85ec3353a17da6ba87f682d4123e5567de822bbdffa0cf992522693c3"
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
