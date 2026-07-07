class Yacron2 < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/yacron2"
  version "1.2.8"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the yacron2 repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.8/yacron2-macos-arm64"
      sha256 "76cfc2bd78f7516b03d061c5d1672d2ca5e4ed9ebfde0a99097369c115d5dd26"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.8/yacron2-macos-amd64"
      sha256 "c25641fd0765e7b110d74bf6d4f98ad05fc44de5fe17ae95dd4125cafe495f62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.8/yacron2-linux-arm64"
      sha256 "04a0f8cbefb82e907da1a7ca578806a04057c7dc3d7972b268d027bc984bf4a5"
    else
      url "https://github.com/ptweezy/yacron2/releases/download/1.2.8/yacron2-linux-amd64"
      sha256 "63f42d98c00514a741e7e1559f913283d563027fb517823adc305808806363d0"
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
