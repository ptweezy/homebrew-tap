class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.74"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.74/cronstable-macos-arm64"
      sha256 "91fc619868b1b22b5a9704f7c4b3d262249fdac320ccd3a1fb13d16b91a0b3d1"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.74/cronstable-macos-amd64"
      sha256 "782a63a8f28f673c0a069f34c15d3bc59634474f6524a10027525b5d6c98e048"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.74/cronstable-linux-arm64"
      sha256 "11a2a9c8475ea40f414c5c691a28ef4f0fb51775b14d20f6cd574bfbd552280e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.74/cronstable-linux-amd64"
      sha256 "9f43c3cb4de1cd9a42a8283b31eb71c6a52b485c088ca13b69e31c4707791def"
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
