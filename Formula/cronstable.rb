class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.36"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.36/cronstable-macos-arm64"
      sha256 "ae4690660a60d1b5dffeff1c1245abe3bb5dccc3a263b1cee35a353278a944c8"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.36/cronstable-macos-amd64"
      sha256 "21a6c39ec101bc0dbf116e5fc1951af28c6cedae2665a839a2668f0a2b5dabae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.36/cronstable-linux-arm64"
      sha256 "6ac4ff64d67af609e1acf7c70d1e9e09e39be6927276d6184809fe18536d7fe7"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.36/cronstable-linux-amd64"
      sha256 "f52fb81d4abad68cfba16e33f43b9091b862f4f33b6f63b176252ce25745ad1d"
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
