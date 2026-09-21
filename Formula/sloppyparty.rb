class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.34"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.34/sloppyparty-macos-arm64"
      sha256 "63b95697e8acd00580b173431c183e772fb55e5bacfcd339588c1e4d541bef7f"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.34/sloppyparty-macos-amd64"
      sha256 "a7a822f0e3738c7df01f81d7bca8547f4549c60a79b6c780d4faf1cd7aa168c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.34/sloppyparty-linux-arm64"
      sha256 "d32e877d6f9495f2635e73c0c2d954130002434c7a6fd1c929b115b782b94bf0"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.34/sloppyparty-linux-amd64"
      sha256 "36fbf595f5a06601264453b8cd24d6dc661f46f701b04cad6f4303c42dde76c8"
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
