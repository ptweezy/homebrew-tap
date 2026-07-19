class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.23"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.23/cronstable-macos-arm64"
      sha256 "9235c3a28f3ad312dad81014c24c0526f5e22c438b076da9dc264ad108550f85"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.23/cronstable-macos-amd64"
      sha256 "551094d165aa34f8b1b553d6394e4f2c7b5b6929649de2f738dd873c71d0a76d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.23/cronstable-linux-arm64"
      sha256 "a0516f43af74e166b5760a9b06f0ba3f7ed3a646a7e0fdb6936b07acdbff28ab"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.23/cronstable-linux-amd64"
      sha256 "3e3e1c3c5603f81f68709840f4c18cfbc7caeca2515193a0827cf0ab7d6bbc17"
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
