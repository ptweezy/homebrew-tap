class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.59"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.59/cronstable-macos-arm64"
      sha256 "4bf06c19ff555edbb8a6dafc6f776e781cc7aeb3e5782e3651d34cfbcef82840"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.59/cronstable-macos-amd64"
      sha256 "94dcc4222c1407a68b8a2718f64fdf9be459b3b1c0b2908504333177fc49a63e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.59/cronstable-linux-arm64"
      sha256 "115cba23407ac252f3aa0388512d175c9c48abc8b82333ab28ec6041b3f67e18"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.59/cronstable-linux-amd64"
      sha256 "e83e4cbcf4cc478abf343ba0cc8670de65889db9d6d4a9f830c7abc89cc67590"
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
