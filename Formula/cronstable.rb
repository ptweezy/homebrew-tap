class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.49"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.49/cronstable-macos-arm64"
      sha256 "fe7acd9928df55689396c3d33f0ce04ca3b79b701a47604f48a187f5ec4e1772"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.49/cronstable-macos-amd64"
      sha256 "f7870f9b775fd37152d7baf93e5e0c81bcde80a228c24c1310b0e6c73ab13dbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.49/cronstable-linux-arm64"
      sha256 "a1ff374ee001ab6fe323ef2d8eee37d6ece30c885a9938eadd494e7788f98c40"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.49/cronstable-linux-amd64"
      sha256 "59d88b58079a5bf98dd0c85eba5d78a3eeea6f24b371b9afa0626bd185a4a21f"
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
