class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.53"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.53/cronstable-macos-arm64"
      sha256 "61350ad074bd6ffea14790f529182f98ba11de725f7d6557e97fb21ecd9814f0"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.53/cronstable-macos-amd64"
      sha256 "6061fd11b1baa5a12b6de13faac395c13617b34302d54c42e3dd81324ee043f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.53/cronstable-linux-arm64"
      sha256 "536b9e9b8f1e376364e5499800443d85301a15193a13bda2aeb6e470c13854db"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.53/cronstable-linux-amd64"
      sha256 "77a89346edde1f304e8dbeb8380d712a63f070ad54ff726f22cff18740eb8b2e"
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
