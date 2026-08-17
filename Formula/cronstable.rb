class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.43"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.43/cronstable-macos-arm64"
      sha256 "bdfd35c3e50134ab20600f5f31a2cbfa660978bad7feb49b9e3ab239915d1f6c"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.43/cronstable-macos-amd64"
      sha256 "929539e641111f2cd3ba4c32fec83515ee74ba75baab0af2375600ad07b3fd28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.43/cronstable-linux-arm64"
      sha256 "b3e8aceeaa813a30372f4bf60a47687fe7102d72b56411ba68e3622ab80d2c07"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.43/cronstable-linux-amd64"
      sha256 "ae90eb477c65bafd6dc24277204bafbad6c27c8761cd9d7b835b1caa9a22a33d"
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
