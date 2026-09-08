class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.50"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.50/cronstable-macos-arm64"
      sha256 "614bde9b51bbf68ccca3106271551255e2a09663ed51ec72a8ebd75c7c022912"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.50/cronstable-macos-amd64"
      sha256 "34e9f2bddea671d6505fc684bc03e7fcf69a53a93381e3755b8416dbcdf16d72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.50/cronstable-linux-arm64"
      sha256 "22dc2ea0fa20138059b5a49443c5d2c2dce8de67aed5a0f66ad2d781f98e03ff"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.50/cronstable-linux-amd64"
      sha256 "d6240186c04672d235e6297c016efec799f6d164c26250d8ab486b48ddb3356e"
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
