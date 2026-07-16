class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.18"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.18/cronstable-macos-arm64"
      sha256 "78f0070d202eabfcb9cb2d6521c1cc0d956b2a1106760f66d0792010d2345b8e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.18/cronstable-macos-amd64"
      sha256 "5cb8eb1501c41bd22b3b170ff3863e7ce9fbe85be8a1314c1fd72a47bca7e9fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.18/cronstable-linux-arm64"
      sha256 "594b95b3e936ef2c14610d7606125bd0c5085ab2e4270c419a422ca69c601a3e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.18/cronstable-linux-amd64"
      sha256 "0bb5815932e4d24cfd8fcfe1357561f46c98c24a0091ed1dfbeff8024200cc0d"
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
