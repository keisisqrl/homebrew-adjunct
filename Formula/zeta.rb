class Zeta < Formula
  desc "Minimal DOS emulator designed to run ZZT"
  homepage "https://zeta.asie.pl/"
  url "https://zeta.asie.pl/zeta86-1.0.5-src.tar.xz"
  sha256 "f3e66030f8ba6ca9bede8bb7f4b6630bf68200cd70877d87ae5010b00cea6004"
  license "MIT"
  head "https://github.com/asiekierka/zeta.git", branch: "master"

  livecheck do
    url :homepage
    regex(/href=.+?zeta86-(\d+?\.\d+?\.\d+?)-src\.t/i)
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
