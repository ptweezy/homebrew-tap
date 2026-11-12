class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.76"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.76/cronstable-macos-arm64"
      sha256 "91247c85a020268faf0fc17b6942f32f6bec667c15c4f611775bf30ce7f1cc6c"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.76/cronstable-macos-amd64"
      sha256 "2ace831bfc160373b3961cbc06674ced1c46a7618b6cbbccc69187daf354a2ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.76/cronstable-linux-arm64"
      sha256 "c79541de9834d0b8f04182a40d9c4eedf65f37b4301c9fdf66a30fffe350bc3f"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.76/cronstable-linux-amd64"
      sha256 "455bf868899ca75eefbdfc1673f41092d4dfe8fb89e6ef7f63c45e181b89d14f"
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
