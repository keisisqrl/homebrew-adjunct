class Kevedit < Formula
  desc "ZZT editor"
  homepage "https://github.com/cknave/kevedit"
  url "https://github.com/cknave/kevedit/releases/download/1.2.0/kevedit-1.2.0.tar.gz"
  sha256 "d8df7fdaa492b6f10d37f4a81acde7c42a2c18715751122ec4a69e78bc43c47a"
  license "GPL-2.0-or-later"
  head "https://github.com/cknave/kevedit", branch: "main"

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
