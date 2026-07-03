class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.2"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.2/yacron2-macos-arm64"
      sha256 "0ffa4ddc81d14abc6b292874af666cb8e71874ea28936dcac8f28ff39dc21555"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.2/yacron2-macos-amd64"
      sha256 "7e4f6c122d7ef2063dfd9340eb6af838781d79da7cbb8d66dbae7fa9c84bcae5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.2/yacron2-linux-arm64"
      sha256 "96a114e6e00030dadcc749196f5140f13a9e8a6095c6b0da8f590a8a1efa2113"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.2/yacron2-linux-amd64"
      sha256 "2d65feb5e7dab0b07a73a6dcb1146cff563d8c751b9bf827778ae2e539e1b295"
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
