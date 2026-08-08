class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.37"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.37/cronstable-macos-arm64"
      sha256 "339be78dfa2fd9b45c47d29127d4b15dacfc770eaaeda01dd584dbf1354dc03d"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.37/cronstable-macos-amd64"
      sha256 "bc0e07ed300bc321a582707db28631738f7555c40ab58afe00eff44ce8c58f90"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.37/cronstable-linux-arm64"
      sha256 "60c11a1860cccadbdead99a25d7022c3cd38352dc518d93fdb78a53e65700119"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.37/cronstable-linux-amd64"
      sha256 "d45c3a0b4c01902cf4d688a407b05a0842b9695b578adac3df8ff4c99bf93d4b"
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
