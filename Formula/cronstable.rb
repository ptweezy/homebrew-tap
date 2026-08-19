class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.44"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.44/cronstable-macos-arm64"
      sha256 "f0a3efab7ee659878d0ce742134a14f4aa969ced6eafd05f6483c5a7c2690f5e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.44/cronstable-macos-amd64"
      sha256 "86e37adb5e7bcd7784cd2452987ea67b903fd1eba13f7a420d076400f25e72ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.44/cronstable-linux-arm64"
      sha256 "998a966e07c62c33dba85d42802e5675a386f2c5dfdbee9a0a4093da76744ef4"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.44/cronstable-linux-amd64"
      sha256 "6f84d46599a750b93a05b82f82deca55fdfb862eea318ea7e503ba0cb7adc08b"
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
