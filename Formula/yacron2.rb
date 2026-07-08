class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.10"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.10/yacron2-macos-arm64"
      sha256 "0fee6aaaabc36d914f278b49653bf86135cdbbe53670656c925b1085e9c1c45f"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.10/yacron2-macos-amd64"
      sha256 "2e73e1efe105dbec80e1364107659d050900c8b6938d4fc15b554be8fbdb8c4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.10/yacron2-linux-arm64"
      sha256 "50229bf7e8d2fde0086cd34ec6cd7c3bd0c77db4fb72ec582de1071d9004dd4e"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.10/yacron2-linux-amd64"
      sha256 "8197e514239c43b71e114cb990aee2edba16178625411e55a50b31784f176c71"
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
