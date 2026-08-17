class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.42"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.42/cronstable-macos-arm64"
      sha256 "1e5af9f45f58c63673ac213e435f58b2b392f4a99e7f0111ee9a192596949d04"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.42/cronstable-macos-amd64"
      sha256 "adaff5912aedf01c75bfa11980130f7cff97d1c9c69a04dfe10cf56c796f1a8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.42/cronstable-linux-arm64"
      sha256 "cd0aaedc3943973e4d15a507a824fb8f283b8299b22ef3b1df2f9762f7628ade"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.42/cronstable-linux-amd64"
      sha256 "8158d2bafaef885b069d566ead38d7bcda93eeb1f30ceebd9f48bf22997346af"
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
