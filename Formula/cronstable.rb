class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.24"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.24/cronstable-macos-arm64"
      sha256 "fd7b73d7a016b7ea3dc77ab9255b30a3ef3d61b7aefc0a8f989d623883640a1b"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.24/cronstable-macos-amd64"
      sha256 "4a887fbb754751262f63de45a8a48a9818e5b20bc8c592fab396f4b50b1122ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.24/cronstable-linux-arm64"
      sha256 "71aef349432586ed000b7634d8d906033126a10051cb853a80b6f94de5fa07da"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.24/cronstable-linux-amd64"
      sha256 "434d40cc859779957fa102b9067a8c6cc714f79b52279c3029c8896f9c41ae5f"
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
