class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.22"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.22/cronstable-macos-arm64"
      sha256 "d165b93c7a58a0f9fe03049ac34d02992915472aa4528b81aab200c435fd0f0e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.22/cronstable-macos-amd64"
      sha256 "b1d7e047d05c9f781b359bd29e9eabe65f4a52784e2a7b9aa4f84d6708627301"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.22/cronstable-linux-arm64"
      sha256 "eb5dd71c1142ad5b03913fde1824965ebc5127da62eb07f61e195a787c55261e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.22/cronstable-linux-amd64"
      sha256 "626ed121392dc4ba0c22e504329ab6841ff44427f172d1fe92b00ffea5c77771"
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
