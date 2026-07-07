class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.7"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.7/yacron2-macos-arm64"
      sha256 "82c14815ca2560dbc5e5da00b1297a2b47b177382b772c19d5a693b79d19f404"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.7/yacron2-macos-amd64"
      sha256 "19ad42427f5e4233ec7d9331bd9bd066abc420305d9760cbf6131c749b869241"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.7/yacron2-linux-arm64"
      sha256 "de239da719a4580ef33675b3de2900044ed54b7f809dc27e573a8074b72d0e09"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.7/yacron2-linux-amd64"
      sha256 "62d6036eb5c6a757de2424d13eecf2ded56dc3a32601257fb905f044ce3589f4"
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
