class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.28"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.28/sloppyparty-macos-arm64"
      sha256 "0a68fde622b4aaa11f81a20b821f1ae9854b7fe7d2a103db69af1f06ad619e99"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.28/sloppyparty-macos-amd64"
      sha256 "bc894a722304005ec470da446ad97052b417685c6078aaa221a0fb4162f37ba7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.28/sloppyparty-linux-arm64"
      sha256 "27bd86d46734351cf96029616d399bed9c023bd5d3dacad6f4cba7974dbe409a"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.28/sloppyparty-linux-amd64"
      sha256 "6a9932fb4909e8a2b53de0366332968a60d534e64a8c59c975524ff1ef8c947a"
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
