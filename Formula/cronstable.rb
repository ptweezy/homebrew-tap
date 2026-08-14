class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.40"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.40/cronstable-macos-arm64"
      sha256 "f114c69bc960bf54a24c73a3a2aee656b57b9a276aa3e3fd7328dd9c2e29cacb"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.40/cronstable-macos-amd64"
      sha256 "c81d53f0ef8a1ee4dba10398aaccd55cc546eee582578f19b8229cb830b4beb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.40/cronstable-linux-arm64"
      sha256 "27db36e5952669cd6e47c7826884034a1178a2b6e832603894520da6da869087"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.40/cronstable-linux-amd64"
      sha256 "a9f3c590b132060b8a366236b279bd597d304ac2072e3a9bf44e3512327dc218"
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
