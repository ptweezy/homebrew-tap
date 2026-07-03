class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.6"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.6/yacron2-macos-arm64"
      sha256 "81e6ee8641568ffa4f0256133f9dc85e57f8f29a419b1f310699b0b70e1af114"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.6/yacron2-macos-amd64"
      sha256 "26402ab7899752328d3c313ed9c5dc99ae1e7064845faef284589b1fa7f3f7cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.6/yacron2-linux-arm64"
      sha256 "2a6ecc7823192896db0ef2281172fd29152dd6959c4820361e1ffa7121b22ba3"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.6/yacron2-linux-amd64"
      sha256 "368b0984e77286b5e77700fa21b724ceafa702f27229c40e70c3e393574962c2"
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
