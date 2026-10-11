class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.39"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.39/sloppyparty-macos-arm64"
      sha256 "8cb5ae1ab0f6afd9330e23d5b735e4ba2b35a94e8dfa1debe0f3b3cb3b5965e8"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.39/sloppyparty-macos-amd64"
      sha256 "58217c4eee2158c4f891674329e7011e614ac2a2a1dc3612e1a4b61bbb6173c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.39/sloppyparty-linux-arm64"
      sha256 "de996697d1906d5d97d8f05ef37ef770f00543025d75c31d296f18b6ba0894e2"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.39/sloppyparty-linux-amd64"
      sha256 "935d2ade42a40650b47bb9a3ee6a7652728b1d6be5fd6b39085098d5f997b99f"
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
