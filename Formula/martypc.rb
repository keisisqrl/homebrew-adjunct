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
