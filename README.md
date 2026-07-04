# homebrew-macjuice

Homebrew tap for [MacJuice](https://github.com/aakarsh-goyal/macjuice) — a
native macOS menu bar battery monitor with history and a Liquid Glass UI.

```sh
brew install aakarsh-goyal/macjuice/macjuice
cp -R "$(brew --prefix)/opt/macjuice/MacJuice.app" /Applications/
open /Applications/MacJuice.app
```

Builds from source on your machine (Command Line Tools required — Homebrew
already needs them), so there is no Gatekeeper quarantine.
