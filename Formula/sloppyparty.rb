class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.17"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.17/sloppyparty-macos-arm64"
      sha256 "a49f63d45fbc61dc1722fbdb3e16b997afb5777a317638b003a61515c196a2bb"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.17/sloppyparty-macos-amd64"
      sha256 "6ea6de7524d2e921d73d78bbabc1d0e9c2c3db7bd97478886d111de409175142"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.17/sloppyparty-linux-arm64"
      sha256 "9e755257d5a8d20ab9dd5a56935c3e4b4629fab74ef6dd57eff8f6bba09788b8"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.17/sloppyparty-linux-amd64"
      sha256 "4bd60bd0dcc887855ed7c690cc81fd36e082f8f8a4cb80099033191b126993c6"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    # The release asset is a single self-contained executable; it is the only
    # file staged from a non-archive download. Install it under its plain name.
    bin.install Dir["*"].first => "sloppyparty"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sloppyparty --version")
  end
end
