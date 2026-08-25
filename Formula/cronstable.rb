class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.48"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.48/cronstable-macos-arm64"
      sha256 "6e558bdb343f6564647adecfa137716865b863c71e9c21a44de006400d066815"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.48/cronstable-macos-amd64"
      sha256 "22268e75739eea0ff72625de154b5944a18fafee6b0132c2b062e01a92e67db3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.48/cronstable-linux-arm64"
      sha256 "f31deb128958b1247f40d26d3c676c456dac29bc1c4d0e9dc3be8a50361cd288"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.48/cronstable-linux-amd64"
      sha256 "7bda5bba5330fceebfa91f273f1754515ef6c938b6dc92a432dd94d37072540c"
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
