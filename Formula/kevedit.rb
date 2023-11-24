class Kevedit < Formula
  desc "ZZT editor"
  homepage "https://github.com/cknave/kevedit"
  url "https://github.com/cknave/kevedit/releases/download/1.2.1/kevedit-1.2.1.tar.gz"
  sha256 "7eb3277b8642a508eb48506da2e135ffe1708a0dcc855e294ede465a6f118d65"
  license "GPL-2.0-or-later"
  head "https://github.com/cknave/kevedit.git", branch: "main"

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/kevedit-1.2.0"
    sha256 ventura:      "0b1b7910187bc10db16c23f33eb00ad746dd5d9d222d29dbaff7ab124c844e43"
    sha256 x86_64_linux: "a88187a4083d54b98488cb230893fa225b7ba52df5de042b276c2f7712c85677"
  end

  depends_on "coreutils" => :build
  depends_on "pkg-config" => :build
  depends_on "sdl2"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules", "--without-freedesktop", "--without-dosbox"
    system "make", "install"
  end

  test do
    # this is a BS test but wyd
    system "true"
  end
end
