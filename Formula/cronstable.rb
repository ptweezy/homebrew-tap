class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.52"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.52/cronstable-macos-arm64"
      sha256 "d0aba71ad7c34a2b875ae73a801a0f507db86ab9acf3f669cee3a4f2ae510e37"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.52/cronstable-macos-amd64"
      sha256 "eaaaf54736bfd47984f74e6f48e9737dfd40817c23e1b0a81cb9471df27df68a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.52/cronstable-linux-arm64"
      sha256 "57197b9bdf4b696c9b9042d0e9b52e1fa6f1547df5bcb4f073d6a49a9a11cf2d"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.52/cronstable-linux-amd64"
      sha256 "c6666afd2c2a530896b1a61dd165f0133b4aafafbcb43e725af76b9cac9f876e"
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
