class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.22"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.22/sloppyparty-macos-arm64"
      sha256 "147824f7d1b620362839635050d7e37566a4e8fb4db126085bbb5e622e96d213"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.22/sloppyparty-macos-amd64"
      sha256 "6b4dcab1e6ea1116a7cf065f9008d46db6ad84823823e277bf9c902e6303a5cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.22/sloppyparty-linux-arm64"
      sha256 "07eb8bc750033c817f18744ae25967bc9d85829c6fcef0d256d4c724ac87fca6"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.22/sloppyparty-linux-amd64"
      sha256 "dc3651ceff48521042df4ad93187ff418f1193bd9917ba242227b715423eec7f"
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
