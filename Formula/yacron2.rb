class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.3"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.3/yacron2-macos-arm64"
      sha256 "65d2a51e15b98c157889b068d54db9977d6af35568d633bf557d1baa214c435c"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.3/yacron2-macos-amd64"
      sha256 "afcde33a5eb57614109b410894537dd9c79496b3af4902fe92f5e1866d14f7c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.3/yacron2-linux-arm64"
      sha256 "e41563c78e21ce137070f181b6d996510bd7109c2d26b976d8945c55e8e65d0e"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.3/yacron2-linux-amd64"
      sha256 "aa4454cbed6eedda806fbd2eaf2f09de3c18f02728a3cde95f0e13d0f3d0ba7c"
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
