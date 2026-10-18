class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.69"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.69/cronstable-macos-arm64"
      sha256 "773a7c400a42f6923f42040c7bf385a106aa35f0deab381cb154a0196cfe6241"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.69/cronstable-macos-amd64"
      sha256 "18d6711c3a1ce7146b2ecf8498ef21152148f60b320c5fc8447af07c12727782"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.69/cronstable-linux-arm64"
      sha256 "f3ecbd644aad27854cd7dfdb65e1fd1afe6d99b8395e507bc03d3063d7deb768"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.69/cronstable-linux-amd64"
      sha256 "375d27f38de3c7e263abc6b2f3d9903666a48826c78712a044dcd874c46c5de5"
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
