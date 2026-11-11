# homebrew-macjuice

Homebrew tap for [MacJuice](https://github.com/aakarsh-goyal/macjuice) — a
native macOS menu bar battery monitor with history and a Liquid Glass UI.

```sh
brew install --cask aakarsh-goyal/macjuice/macjuice
```

Installs the prebuilt, ad-hoc signed Apple Silicon MacJuice.app straight into
/Applications and clears the download quarantine flag so it launches.

```sh
brew uninstall --cask macjuice          # remove the app
brew uninstall --cask --zap macjuice    # ...and its recorded data and preferences
```
