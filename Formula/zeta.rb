class Zeta < Formula
  desc "Minimal DOS emulator designed to run ZZT"
  homepage "https://zeta.asie.pl/"
  url "https://zeta.asie.pl/zeta86-1.0.7-src.tar.xz"
  sha256 "2ecf2ba1eabb3c91af95f0ed412c35cf918ca30bce1d8000cb4419fb53f91547"
  license "MIT"
  head "https://github.com/asiekierka/zeta.git", branch: "master"

  livecheck do
    url :homepage
    regex(/href=.+?zeta86-(\d+?\.\d+?\.\d+?)-src\.t/i)
  end

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/zeta-1.0.5"
    sha256 cellar: :any,                 ventura:      "5a956bdd2621302d129690ccecc2e3cde5f78568967614fe9312884dbd88d893"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a5964465ec2110d3c9b94c83cffe1057399f4efcb090b973d0ff8c783c079a8d"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pillow" => :build
  depends_on "pkg-config" => :build
  depends_on "python@3.11" => :build
  depends_on "libpng"
  depends_on "sdl2"

  def install
    system "./autogen.sh"
    system "./configure", "--with-frontend=sdl2", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "zeta [arguments] [world file]", shell_output("#{bin}/zeta -h 2>&1")
  end
end
