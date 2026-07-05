class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.4"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.4/sloppyparty-macos-arm64"
      sha256 "84ae6af1c8bcbd369fda31662f37efe90e894670ba422f4370b8d720ce2db729"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.4/sloppyparty-macos-amd64"
      sha256 "88f46ff3ee9b0a7f90f45d86868410337677608d76d1590c6c887e974c92e74b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.4/sloppyparty-linux-arm64"
      sha256 "b25ae4ff7de806a4a0634990bbf9301bb149f273ca0735647c9783e40f463821"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.4/sloppyparty-linux-amd64"
      sha256 "eaca1de5d014668295590a4f354e9307f9071d4b1f5a30ee4a62cc208317ddc5"
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
