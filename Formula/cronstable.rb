class Cronstable < Formula
  desc "Job scheduler with retries, alerts, run history, and dashboards"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.73"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.73/cronstable-macos-arm64"
      sha256 "694111366756539044ee9962318058fb39ed1fd3e22fc4499b3e370d9af32f8e"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.73/cronstable-macos-amd64"
      sha256 "ed4412fb9e406cc7df6e75cc8ac285b909f85501342abc531abc8a601ee3b2a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.73/cronstable-linux-arm64"
      sha256 "d6b31a0fd009a855648ec97630c8f86fc3c0ed0f538b2944f35e431327224c78"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.73/cronstable-linux-amd64"
      sha256 "3544108182dee04e5fa54c81e1f9697fb358b22f6cee11ea4067b3a02dc02cec"
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
