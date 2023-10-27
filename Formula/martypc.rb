class Martypc < Formula
  desc "IBM PC/XT emulator written in Rust"
  homepage "https://github.com/dbalsom/martypc"
  url "https://github.com/dbalsom/martypc/archive/refs/tags/0.1.3.tar.gz"
  sha256 "29a9568090b6f505f8692efb36ea412f8980e103c8a60f04e0fcd7ee4f8bf815"
  license "MIT"

  livecheck do
    url :homepage
    regex(/^(\d+?\.\d+?\.\d+?)$/i)
  end

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/martypc-0.1.3"
    sha256 cellar: :any_skip_relocation, ventura:      "a0b03db598a39a73cefaa2ca912da735d111782f06159e052924dab90858907b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17f6ca8abd4e665060841aa4e9decd81b037a3a9da129d1553f1ef38f6ac9ca6"
  end

  depends_on "rust" => :build
  on_linux do
    depends_on "alsa-lib"
    depends_on "systemd" # for libudev
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
