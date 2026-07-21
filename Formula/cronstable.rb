class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.26"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.26/cronstable-macos-arm64"
      sha256 "5c31f87621d3039f62ffe94d5b8aeba63f35d3a90def8652a3bc4c84a0d63b49"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.26/cronstable-macos-amd64"
      sha256 "c176814d23bcd0a040559c4ec46359d35dfbb845411e4ee111cf420f0c7d6b66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.26/cronstable-linux-arm64"
      sha256 "55588350e38f2e3e76aa696f0c8312e8336e55d23a28973afd75c9a173931e11"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.26/cronstable-linux-amd64"
      sha256 "3ef8b82d52dad5bb3803dd47d1faf0588774bfe2b27cd41f714e83a6342e8154"
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
