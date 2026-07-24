class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.30"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.30/cronstable-macos-arm64"
      sha256 "737554692bbd028c8e55e55259d029d4fdca71c3e179f46c46ef5976b9a10511"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.30/cronstable-macos-amd64"
      sha256 "6ce11e79f4a2594a2b30658c00ca95c95fda254ea936cde7aef9246ebb392aca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.30/cronstable-linux-arm64"
      sha256 "32121de2152f8088b7b0b2575eff1b76afa58fe57f732dd6ffe1d946df6f506b"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.30/cronstable-linux-amd64"
      sha256 "5d1eec50f9fc5cacd74739a4312ebdef297eabcdbaab82551efd292282a7e11b"
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
