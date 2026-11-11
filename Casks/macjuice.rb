cask "macjuice" do
  version "1.6.0"
  sha256 "02fe8ecb123009d58695178fb9683c839a9d280a9ce7cafde21226cf50064582"

  url "https://github.com/aakarsh-goyal/macjuice/releases/download/v#{version}/MacJuice-#{version}-arm64.zip"
  name "MacJuice"
  desc "Native macOS menu bar battery monitor with history and Liquid Glass UI"
  homepage "https://github.com/aakarsh-goyal/macjuice"

  depends_on arch: :arm64
  depends_on macos: :sequoia # macOS 15+; the Liquid Glass panel needs macOS 26+

  app "MacJuice.app"

  # Ad-hoc signed, not notarized: clear the download quarantine flag so it launches.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/MacJuice.app"],
                          must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/macjuice",
    "~/Library/Caches/com.macjuice.app",
    "~/Library/Preferences/com.macjuice.app.plist",
  ]
end
