cask "lemma" do
  version "0.2.0"
  sha256 "e8d8d8f29f429caacb184044e2d4d3b5306b776bf77bc41c325f699ffbd7c8fe"

  url "https://github.com/phongndo/lemma/releases/download/v#{version}/lemma-desktop-v#{version}-darwin-arm64.dmg"
  name "Lemma"
  desc "Agent harness in which every part is a plugin"
  homepage "https://github.com/phongndo/lemma"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Lemma.app"
  binary "#{appdir}/Lemma.app/Contents/Resources/lemma/bin/lemma"

  zap trash: [
    "~/Library/Application Support/Lemma",
    "~/Library/Preferences/com.phongndo.lemma.plist",
    "~/Library/Saved Application State/com.phongndo.lemma.savedState",
  ]

  caveats <<~EOS
    Lemma is signed ad hoc, not with an Apple Developer ID, so macOS asks before it
    opens each new version: open System Settings > Privacy & Security, and choose
    Open Anyway beside "Lemma was blocked".
  EOS
end
