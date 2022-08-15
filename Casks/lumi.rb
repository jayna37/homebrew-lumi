cask "lumi" do
  arch = Hardware::CPU.intel? ? "mac" : "arm64-mac"
  version "0.9.4"

  if Hardware::CPU.intel?
    sha256 "b0f7c3973b70fea066b0a775f0ef6a39c10b6f3e236a7bc7df67cf0df90d4450"
  else
    sha256 "3251f360680cbff1f6e213c0374fa3af4259d54d8b312566d1fcf99916d7b9dd"
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
