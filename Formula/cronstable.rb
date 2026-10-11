class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.63"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.63/cronstable-macos-arm64"
      sha256 "ad41dd8626a3297984624fd9a09f98815656a71e8526bd07be7cbb9bec945c0f"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.63/cronstable-macos-amd64"
      sha256 "3403be309bf176784da62e1bbf0f089b3e17864f8398637ecf2010af19cab610"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.63/cronstable-linux-arm64"
      sha256 "d3e4eea59f8ae3f06d58e22cd84b61a29aaee769344511b8b9b2d749260cb788"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.63/cronstable-linux-amd64"
      sha256 "061da4451dc0d5cf6ccd6d3c9deebdea1d197f28c1fdd4751c05845a20faea01"
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
