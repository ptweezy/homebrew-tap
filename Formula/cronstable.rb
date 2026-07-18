class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.20"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.20/cronstable-macos-arm64"
      sha256 "d26547a3e69fd4d45e397b9508d8eb661a7d8e2ff7af619450b063a027bf11eb"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.20/cronstable-macos-amd64"
      sha256 "5561ea9eb202f04dd7ceaae348d6667ff9f39934628b132140cdcaf06d07d649"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.20/cronstable-linux-arm64"
      sha256 "e5012b3eee52c778145a435e6ebec6132423a1803bd2c38cac821dfdf3d03016"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.20/cronstable-linux-amd64"
      sha256 "25411e07a7e9efdc8cf87587d1999670653c065f929603a183d9697ac069afd1"
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
