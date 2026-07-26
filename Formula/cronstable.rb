class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.33"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.33/cronstable-macos-arm64"
      sha256 "092bde449b13cb9adafd4dd97ff6a357c27ab8181401069fb940e7944b13e22c"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.33/cronstable-macos-amd64"
      sha256 "646870080a6abe8763e355a250c172cff57bc235ba6d44e1e02f6eb00188c154"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.33/cronstable-linux-arm64"
      sha256 "34d94e220b0a54f4033cde1fed30933fbe52e636bb26cc359d43fbb6390fb33b"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.33/cronstable-linux-amd64"
      sha256 "84de3b24e5227d9a820667d063fa41bcdb03c10e8ab88f5a424ed56d2807bd02"
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
