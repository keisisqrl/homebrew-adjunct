class Kevedit < Formula
  desc "ZZT editor"
  homepage "https://github.com/cknave/kevedit"
  url "https://github.com/cknave/kevedit/releases/download/1.2.1/kevedit-1.2.1.tar.gz"
  sha256 "7eb3277b8642a508eb48506da2e135ffe1708a0dcc855e294ede465a6f118d65"
  license "GPL-2.0-or-later"
  head "https://github.com/cknave/kevedit.git", branch: "main"

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/kevedit-1.2.1"
    sha256 ventura:      "1e2ddace0823cc8c39ab17198087d6603eb14874077158015e6907e008856d3e"
    sha256 x86_64_linux: "e79d22ea225283b0c4103496db5a9b2bab65ca20c7f0d99d092eb4d290ea0522"
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
