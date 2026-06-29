# frozen_string_literal: true

cask "tokenglance" do
  version "0.1.9"
  sha256 "c1748eebe6a5a75efcf5bc60d92c36c697939ab62fc101e324b6a73ec1db9e77"

  url "https://github.com/marcel-breuer/tokenglance/releases/download/v#{version}/TokenGlance-#{version}-arm64.zip"
  name "TokenGlance"
  desc "Local token usage monitor for AI coding tools"
  homepage "https://github.com/marcel-breuer/tokenglance"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TokenGlance.app"

  zap trash: [
    "~/Library/Application Support/TokenGlance",
    "~/Library/Caches/dev.marcelbreuer.tokenglance",
    "~/Library/Preferences/dev.marcelbreuer.tokenglance.plist",
    "~/Library/Saved Application State/dev.marcelbreuer.tokenglance.savedState",
  ]

  caveats <<~EOS
    TokenGlance is open-source software. Some releases may be ad-hoc
    signed rather than signed and notarized through the Apple Developer
    Program.

    Install it with current Homebrew:

      brew install --cask marcel-breuer/tap/tokenglance

    If macOS blocks the first launch, approve TokenGlance in System
    Settings > Privacy & Security or remove the quarantine attribute for
    this app only:

      xattr -dr com.apple.quarantine /Applications/TokenGlance.app

    Only install releases obtained from the official TokenGlance
    repository and verify the published checksum.
  EOS
end
