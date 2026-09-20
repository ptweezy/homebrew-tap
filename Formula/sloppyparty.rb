class Sloppyparty < Formula
  desc "Portable file server with resumable uploads, media indexer, and WebDAV"
  homepage "https://github.com/ptweezy/sloppyparty"
  version "1.0.33"
  license "MIT"

  # Serve the self-contained PyInstaller release binaries, so there is no Python
  # or compile step for the user. This file is generated on every release by
  # packaging/homebrew/render-formula.sh in the sloppyparty repo; edit the
  # template there, not this generated copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.33/sloppyparty-macos-arm64"
      sha256 "9ab11483194926542496d0d41d650d0deeb9595b84a4c1c22041fb6bee96a61a"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.33/sloppyparty-macos-amd64"
      sha256 "119a056a2544aeb2fd23f153b03adf74043675d5e04b91ad5263141f32f64369"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.33/sloppyparty-linux-arm64"
      sha256 "7bd0e81eee3c97743af7ff02b64744e9ca491493f3ef39711a178df22e8b95b6"
    else
      url "https://github.com/ptweezy/sloppyparty/releases/download/sloppyparty-v1.0.33/sloppyparty-linux-amd64"
      sha256 "75239f29b47cd1244a387c8d6c2c624a3f63f4cd803e7644b6f5c63c035ca668"
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
