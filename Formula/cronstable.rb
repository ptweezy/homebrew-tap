class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.32"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.32/cronstable-macos-arm64"
      sha256 "0e2fc6521e5f9b2a9281b98389be414a92c1197da4ae608f71e1aefd441f5934"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.32/cronstable-macos-amd64"
      sha256 "d4c1e69ce46e3f22de812c5b76feb83e6d6dde37a7f0f508ba212dba8435ea84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.32/cronstable-linux-arm64"
      sha256 "9ac58d9b42e3e6774a363a7514a522fe9ff398bf87e9a8844bb85bf0b8c3c4ad"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.32/cronstable-linux-amd64"
      sha256 "6f2b45863b18ddf50df4f52763eccf7f4032e083780f75c88e17c472f988b9ec"
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
