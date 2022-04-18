cask "lumi" do
  arch = Hardware::CPU.intel? ? "mac" : "arm64-mac"
  version "0.9.1"

  if Hardware::CPU.intel?
    sha256 "bbcad28129668b3e079840bfe2efb2f135130ab27971956be1693484ea3051ba"
  else
    sha256 "0aecb14f5656db52bf1d091a647eafe0002dc3878a792f5230d978af5fd61522"
  end

  url "https://github.com/Lumieducation/Lumi/releases/download/v#{version}/Lumi-#{version}-#{arch}.zip",
      verified: "github.com/Lumieducation/Lumi/"
  name "Lumi"
  desc "Tools to create, edit and share digital content"
  homepage "https://lumi.education/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Lumi.app"

  zap trash: [
    "~/Library/Application Support/lumi",
    "~/Library/Caches/education.lumi.lumi",
    "~/Library/Caches/education.lumi.lumi.ShipIt",
    "~/Library/Logs/Lumi",
    "~/Library/Preferences/education.lumi.lumi.plist",
    "~/Library/Saved Application State/education.lumi.lumi.savedState",
  ]
end
