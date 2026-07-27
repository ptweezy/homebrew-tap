class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.20"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.20/sloppyparty-macos-arm64"
      sha256 "3967509a0f385d5222d03374797fa1e71c4ca121c7a0de399575e2758c07fbe3"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.20/sloppyparty-macos-amd64"
      sha256 "6d361b1e46bed41d29596e6c6068ffa14fd87cecfc2e2e03919bef72df727e03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.20/sloppyparty-linux-arm64"
      sha256 "6ebbe5fd81c0460f0c3994f451be3cd3006ae66182535763703ee78313f68d03"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.20/sloppyparty-linux-amd64"
      sha256 "66a2adb3e827e457c579fec516e3583f7d4a01b0e51c262aae1ddfb1ee96981c"
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
