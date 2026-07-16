class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.15"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.15/sloppyparty-macos-arm64"
      sha256 "76e4f179066b01af995f0e187ff801b5d15e320131306c70e04ac6ed4fbcd63b"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.15/sloppyparty-macos-amd64"
      sha256 "e4d417b75504ca5390ce37d404ac97405c47c3f1fce6e8e368f94be05aeb26b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.15/sloppyparty-linux-arm64"
      sha256 "a00ee09cc05011f2e029176b3e4bf9a020a9aba170c420795cdfe7f28efd0819"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.15/sloppyparty-linux-amd64"
      sha256 "370be36f83dbbe77501ec2855a6ea8294a65fff8c86f2106917c17717f3b80ac"
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
