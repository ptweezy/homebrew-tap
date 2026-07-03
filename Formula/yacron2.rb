class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.4"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.4/yacron2-macos-arm64"
      sha256 "3366314b5fa770e73eb8af76c9163c7c7312baab940c370ec52ffde1ca61be1a"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.4/yacron2-macos-amd64"
      sha256 "6c1f0491bc320d328d4c4b8883d2bfa5d5227887dcc9e4476381ea29e46202b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.4/yacron2-linux-arm64"
      sha256 "836bf8d3d90df910b8a43bb9dd8ec72c57cedb3854ee51141cf959340c2251d4"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.4/yacron2-linux-amd64"
      sha256 "a603c29f8429646559b11354728741d450820dcba20d66f9a0056f30abeb4190"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    # The release asset is a single self-contained executable; it is the only
    # file staged from a non-archive download. Install it under its plain name.
    bin.install Dir["*"].first => "yacron2"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yacron2 --version")
  end
end
