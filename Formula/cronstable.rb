class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.35"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.35/cronstable-macos-arm64"
      sha256 "e9f26d2e427f69d33a4215c0f48e11f338cef4ab239a1831864c71a7f4d82aaa"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.35/cronstable-macos-amd64"
      sha256 "e1f5cf9f1e138aa29ea5c1bef6ff6cb624dbb19b8870a72c9449d58faba76216"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.35/cronstable-linux-arm64"
      sha256 "5cc432bbe90ffef02bc63b0de1242c13c8da4be1f9f216edb4ba8fb7277d3572"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.35/cronstable-linux-amd64"
      sha256 "e47b5bbb13f0fa5c03726c582c7b330f8328fe9df968d56d199e61442d388a01"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    # The release asset is a single self-contained executable; it is the only
    # file staged from a non-archive download. Install it under its plain name.
    bin.install Dir["*"].first => "cronstable"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cronstable --version")
  end
end
