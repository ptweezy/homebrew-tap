class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.67"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.67/cronstable-macos-arm64"
      sha256 "9408f044a878a1b62dd26d5bed1a48b7ab6fee69aebb03a1ab97bb7065de16b1"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.67/cronstable-macos-amd64"
      sha256 "6ea27370f0501bf321becaeb8a84b9c71b10f361eb80d7364691f24776dc78a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.67/cronstable-linux-arm64"
      sha256 "cad0b5958b51961d9d62f10f86abb1d79363e42bee52eb121b214f3b608c8418"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.67/cronstable-linux-amd64"
      sha256 "f091a93beba19487c8410936f105124b3ba809bcd6f690688636d6e50a5af06f"
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
