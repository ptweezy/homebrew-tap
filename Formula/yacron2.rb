class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.5"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.5/yacron2-macos-arm64"
      sha256 "4ff48c961cf0902674f628953e8201af243cb7bd6bca6450011165c0a5d7fef2"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.5/yacron2-macos-amd64"
      sha256 "d10b8889220656ce3d8e51c4d8cffb0499461a3b1c7af01ae2d8243f58e0ed9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.5/yacron2-linux-arm64"
      sha256 "43f08958056a9330236a36cbfd2b3e097725d3229c26446f2c621b270e8a0e5c"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.5/yacron2-linux-amd64"
      sha256 "f24bcfc5bbe49aebfdaaebb86aa8092eb962d1c4befbb7a6ceab2abfa7df6b1d"
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
