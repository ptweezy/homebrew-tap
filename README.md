# ptweezy/homebrew-tap

Homebrew formulae for [yacron2](https://github.com/ptweezy/yacron2) — a modern,
distributed, container-friendly cron replacement.

## Install

```sh
brew install ptweezy/tap/yacron2
```

That one command taps this repository and installs yacron2. Equivalently:

```sh
brew tap ptweezy/tap
brew install yacron2
```

Upgrade with `brew upgrade yacron2`.

## What you get

The formula installs the self-contained release binary for your platform (signed
and notarized on macOS), so no Python or build toolchain is required. Supported
platforms: macOS (Apple Silicon and Intel) and Linux (arm64 and amd64) via
Homebrew on Linux.

New releases are published here automatically by the yacron2 release pipeline.
Each release also ships a `SHA256SUMS` manifest, and the formula pins the exact
SHA256 of every binary it installs.

## Usage & docs

See the [yacron2 README](https://github.com/ptweezy/yacron2#readme) and the
[wiki](https://github.com/ptweezy/yacron2/wiki).
