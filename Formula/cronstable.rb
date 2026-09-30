class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.60"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.60/cronstable-macos-arm64"
      sha256 "43d9677cf5569a96c71142c9f6a66455fdcf9932cda78ed0a0222cc5535bbaae"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.60/cronstable-macos-amd64"
      sha256 "3c0efb96246ca6e310f079fe19161fb63f5fe51b30f9cc65baa5f939fc510300"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.60/cronstable-linux-arm64"
      sha256 "a5d56794d8a386928be72086edf33c78a5f6dcf465f5e32d2733e15356414859"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.60/cronstable-linux-amd64"
      sha256 "f71ba5ebfda295b8f5f9cc7e8a995fba5eff6d6d1e0ab48ac6818ecd7feba352"
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
