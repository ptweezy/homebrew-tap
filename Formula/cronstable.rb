class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.29"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.29/cronstable-macos-arm64"
      sha256 "1cbb5010a0dbce0616ce819181a0ca0ea4a0dac13b94fb762257ffc6b1232f25"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.29/cronstable-macos-amd64"
      sha256 "83fc8e0794f13f3dc6b3d6fa7d187f22ca3d34db11234fe553efaa86824c756e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.29/cronstable-linux-arm64"
      sha256 "0b33bdac11dc55028aa06457362528b21ee96889746d5efd147f62f7d2f89cd5"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.29/cronstable-linux-amd64"
      sha256 "d2677497002f2529dffb0a1efa8a34345b8eb1061eb0466448a5db23647ea8d5"
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
