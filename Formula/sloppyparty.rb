class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.29"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.29/sloppyparty-macos-arm64"
      sha256 "b07082d3c89dee2270a23a7c4377f06a4ef336c69910dc5a2a9d34191e99109f"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.29/sloppyparty-macos-amd64"
      sha256 "ba6f7d625b086dfabd74c2c49c6189b74feaa96baa2438e817041166025f7f03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.29/sloppyparty-linux-arm64"
      sha256 "580b35a18def1cfa1c83815ae7becf9bd9ad05f1f307f87a8b394889873b2123"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.29/sloppyparty-linux-amd64"
      sha256 "de5cd543fc3026ea721307c488696989bd65ca0edafbb2d17caa9e527146611a"
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
