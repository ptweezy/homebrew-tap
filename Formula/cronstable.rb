class Cronstable < Formula
  desc "Modern, distributed, container-friendly cron replacement"
  homepage "https://github.com/ptweezy/cronstable"
  version "1.2.39"
  license "MIT"

  # Serve the signed + notarized (macOS) self-contained release binaries, so
  # there is no Python or compile step for the user. This file is generated on
  # every release by packaging/homebrew/render-formula.sh in the cronstable repo;
  # edit the template there, not this copy.
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.39/cronstable-macos-arm64"
      sha256 "1f373a09f519243a1c071c55f4cbcad11ae57606ee1141b66e85887a6201f5e2"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.39/cronstable-macos-amd64"
      sha256 "745df891df167968042e827459a805a9d8bff1191c407db0cbe950138c3ab6f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.39/cronstable-linux-arm64"
      sha256 "8192760b9fe9be2599f4d89283353145495cb492005f3d1647e0999a11aefc33"
    else
      url "https://github.com/ptweezy/cronstable/releases/download/1.2.39/cronstable-linux-amd64"
      sha256 "db8b7007253028c0fea998ec20e0134666747312461fcd17bcb249bdf5be215a"
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
