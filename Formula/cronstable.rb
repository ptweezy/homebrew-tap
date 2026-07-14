class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.15"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.15/cronstable-macos-arm64"
      sha256 "1a0d49a696481b3534b3d30fdba3bca71ee51c9f8b438ee28e0a604a95130854"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.15/cronstable-macos-amd64"
      sha256 "ecbcd7dce8e836f9f504d8bc994ca130e975dbff5e43ed9fc089cd8988c8ab56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.15/cronstable-linux-arm64"
      sha256 "9a41f2a4aec35dd3cd93b6b8967d3eee6a6eb0f87f046c713614a03c98834886"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.15/cronstable-linux-amd64"
      sha256 "1b2733e678eacbb68c39372fb48d8773bd897af88ec2bff8433add97121ff92f"
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
