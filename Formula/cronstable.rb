class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.75"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.75/cronstable-macos-arm64"
      sha256 "a12a3e34b4d45901256e0c1a7d69ac17392ff347ea3819454fd4caf183312ec8"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.75/cronstable-macos-amd64"
      sha256 "fddc8cfe77a3c91f3b4fd35ea7feeab08e07dded4f95b480cfa41e6ab75983d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.75/cronstable-linux-arm64"
      sha256 "37d63416ea14bdfb9bfddeb4286e76bd0231c8ea5a5282a5de533acc67bfe36b"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.75/cronstable-linux-amd64"
      sha256 "a544db8624aa894d5a2323616c380a466679639402e3297bfe6ac76757faff06"
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
