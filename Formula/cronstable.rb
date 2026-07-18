class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.19"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.19/cronstable-macos-arm64"
      sha256 "18fa137d3b12d9390e12b97c69051e37927aeebf5cf2e3445859ce3318c96838"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.19/cronstable-macos-amd64"
      sha256 "a7e2c61c46bd1a066c2a608ec8270034ce14f2feb682dd47897ceb08d086f3ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.19/cronstable-linux-arm64"
      sha256 "d078579d3459751f21c63fc6f231d41fc9eab3fd523ed80a0952dc768645c116"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.19/cronstable-linux-amd64"
      sha256 "9902aa0aa62159f234603e67a420bc8e5def75c5089f4c682b71384ce7a14f7b"
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
