cask "intiface-central" do
  version "2.5.1"
  sha256 "894af0642a2415a019424a7e0fbed1ac4bf96a6bcc58436fc7cb85c65a7b36e1"

  url "https://github.com/intiface/intiface-central/releases/download/v#{version}/intiface-central-v#{version}-macos-universal.zip",
      verified: "github.com/intiface/intiface-central/"
  name "Intiface Central"
  desc "Buttplug Frontend Application for Desktop and Mobile"
  homepage "https://intiface.com/central/"

  livecheck do
    strategy :github_releases
  end

  depends_on macos: ">= :mojave"

  app "Intiface Central.app"
end
