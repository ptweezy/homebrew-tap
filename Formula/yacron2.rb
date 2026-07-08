class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.9"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.9/yacron2-macos-arm64"
      sha256 "e547bbbeab66a351f3486d8e029a5cdbbc0f743d913c7127f92f90c3c6da0d84"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.9/yacron2-macos-amd64"
      sha256 "11ed0d420102bfbcda82c6078c7ed3c84cdbf121e02864c374e98326c616b55d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.9/yacron2-linux-arm64"
      sha256 "ff4c321541f7bb29a3e375836f938617ed171fa045862ef9413d049e8575e223"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.9/yacron2-linux-amd64"
      sha256 "cc20160c71746b707658a4f8b4bcc61846165e8d1c5b90a1a6f3d5b68d25cb21"
    end
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    # The release asset is a single self-contained executable; it is the only
    # file staged from a non-archive download. Install it under its plain name.
    bin.install Dir["*"].first => "yacron2"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yacron2 --version")
  end
end
