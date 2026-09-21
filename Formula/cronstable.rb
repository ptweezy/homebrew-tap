class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.54"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.54/cronstable-macos-arm64"
      sha256 "8e45e666028c00b795375572647d7651c0906443563d9c6e47c9027ca1cb9f6b"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.54/cronstable-macos-amd64"
      sha256 "7f25145cf194c5ecaf71658086282087c8d0210d3295ef76b3870b0481b25c19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.54/cronstable-linux-arm64"
      sha256 "6a1468781aea1b663d4035fb1b8856c0c0a5f8acfc80f329cc7e2a7f059f0bc8"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.54/cronstable-linux-amd64"
      sha256 "3917126334d24a78288a11bdf584e368ecfc86623e82bbba6029267b0fda6a81"
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
