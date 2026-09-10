class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.51"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.51/cronstable-macos-arm64"
      sha256 "77a7ef6b6b472c9ba78552ac9b79cc44eb86366fc89064aef3c1cf052b8ae26d"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.51/cronstable-macos-amd64"
      sha256 "d1f7ba3725ea704bf29437ad04b937f96f94a453e64b8ce6cd2fde7e32cedfbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.51/cronstable-linux-arm64"
      sha256 "03cd487116ba29d0b9f9c234208c6363abd7bc022a18e2ec463017d4a7526abc"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.51/cronstable-linux-amd64"
      sha256 "78eb14ba2f905bf680582a094a43290bad8c03b350fe5cb9c92c18d5d4699852"
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
