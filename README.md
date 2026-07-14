# ptweezy/homebrew-tap

Homebrew formulae for [cronstable](https://github.com/ptweezy/cronstable) — a modern,
distributed, container-friendly cron replacement.

## Install

```sh
brew install ptweezy/tap/cronstable
```

That one command taps this repository and installs cronstable. Equivalently:

```sh
brew tap ptweezy/tap
brew install cronstable
```

Upgrade with `brew upgrade cronstable`.

## What you get

The formula installs the self-contained release binary for your platform (signed
and notarized on macOS), so no Python or build toolchain is required. Supported
platforms: macOS (Apple Silicon and Intel) and Linux (arm64 and amd64) via
Homebrew on Linux.

New releases are published here automatically by the cronstable release pipeline.
Each release also ships a `SHA256SUMS` manifest, and the formula pins the exact
SHA256 of every binary it installs.

## Usage & docs

See the [cronstable README](https://github.com/ptweezy/cronstable#readme) and the
[wiki](https://github.com/ptweezy/cronstable/wiki).
