class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.68"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.68/cronstable-macos-arm64"
      sha256 "772f7e109250dd343c4d62574214ae3129cc72d1ae28268253e5a20962c1b770"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.68/cronstable-macos-amd64"
      sha256 "31549ec5f973a33bec637be40241f5dc7734a54c0e7a993a828d5c6d2bd295c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.68/cronstable-linux-arm64"
      sha256 "e4a917615dbea2768ddc9aecc3c453cf6122fbb464b431f8fc96f532312591ea"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.68/cronstable-linux-amd64"
      sha256 "c929c11607312393aa48445c03fdfaf247386057ee201c4326401eb89a5cbe4b"
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
