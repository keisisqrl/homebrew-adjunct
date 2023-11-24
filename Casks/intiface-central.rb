cask "intiface-central" do
  version "2.5.3"
  sha256 "74d69b1c6ca104b5d1ac734af9ff4e5504dd99d6f5cb0cad2ad0ee9aa42e5051"

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
