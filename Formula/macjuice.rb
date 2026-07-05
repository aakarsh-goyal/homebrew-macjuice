class Macjuice < Formula
  desc "Native macOS menu bar battery monitor with history and Liquid Glass UI"
  homepage "https://github.com/aakarsh-goyal/macjuice"
  url "https://github.com/aakarsh-goyal/macjuice/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "a229fd98e740eaafd3fa35396c225c1199531a94980c9cdd8bce5953ac2c942e"
  license "MIT"
  head "https://github.com/aakarsh-goyal/macjuice.git", branch: "main"

  depends_on macos: :sequoia # macOS 15+; the Liquid Glass panel needs macOS 26+

  def install
    cd "MacJuiceApp" do
      system "swift", "build", "-c", "release", "--disable-sandbox"
      app = prefix/"MacJuice.app"
      (app/"Contents/MacOS").mkpath
      (app/"Contents/Resources").mkpath
      cp ".build/release/MacJuice", app/"Contents/MacOS/MacJuice"
      cp "Support/Info.plist", app/"Contents/Info.plist"
      cp "Support/AppIcon.icns", app/"Contents/Resources/AppIcon.icns"
      system "codesign", "--force", "--sign", "-", app
    end
  end

  def caveats
    <<~EOS
      MacJuice was built (and ad-hoc signed) on this machine, so there is no
      Gatekeeper quarantine. Copy it to /Applications so Launch at Login has
      a stable path that survives upgrades:

        cp -R "#{opt_prefix}/MacJuice.app" /Applications/
        open /Applications/MacJuice.app

      History is recorded to:
        ~/Library/Application Support/macjuice/battery.db
    EOS
  end

  test do
    assert_path_exists prefix/"MacJuice.app/Contents/MacOS/MacJuice"
  end
end
