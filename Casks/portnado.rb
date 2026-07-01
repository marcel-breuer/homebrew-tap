cask "portnado" do
  version "0.1.0"
  sha256 "0caaa0be2423ee7b6203a6af9b1c70dcaed6b895da0009bb956a43688e74d41d"

  url "https://github.com/marcel-breuer/portnado/releases/download/v#{version}/Portnado-v#{version}-darwin-arm64.zip"
  name "Portnado"
  desc "Stable local routes for changing development ports"
  homepage "https://github.com/marcel-breuer/portnado"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Portnado.app"
  binary "#{appdir}/Portnado.app/Contents/Resources/bin/portnado"

  uninstall launchctl: "dev.portnado.daemon",
            quit:      "dev.portnado.app",
            delete:    "~/Library/LaunchAgents/dev.portnado.daemon.plist"

  zap trash: [
    "~/Library/Application Support/Portnado",
    "~/Library/Logs/Portnado",
  ]

  caveats <<~EOS
    Portnado currently ships without Developer ID notarization. macOS may show
    an unidentified-developer warning and may say Apple cannot check it for
    malicious software the first time you open the app.

    The CLI is available as:
      portnado

    The daemon can be started by the app or with:
      #{appdir}/Portnado.app/Contents/Resources/bin/portnado-daemon

    Zap removes Portnado user state and logs only. It does not delete
    repository .portnado.yml files.

    Portnado does not disable Gatekeeper or remove quarantine automatically.
    If macOS blocks the first launch, approve the app manually in Finder or
    System Settings after verifying the release source.
  EOS
end
