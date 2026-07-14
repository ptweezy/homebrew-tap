class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.16"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.16/cronstable-macos-arm64"
      sha256 "9b73f30061bb2281faa05f6ba1295a341b05cf243b517468a97dc4e1a3e30397"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.16/cronstable-macos-amd64"
      sha256 "d7c0431866383d1362d384b1634026642969ababce0edc8bc5626796c27467e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.16/cronstable-linux-arm64"
      sha256 "1663db4c5d57bbf190a7efbb792c5575c9e0c9e31bad4c008cf353ad1e55b9e4"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.16/cronstable-linux-amd64"
      sha256 "039316bc1e805c985157b1a664ac9401d5880f60df686f3489a7c796a78b9a73"
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
