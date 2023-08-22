class Droidstar < Formula
  desc "Multi-mode ham digital voice client"
  homepage "https://github.com/nostar/DroidStar"
  url "https://github.com/nostar/DroidStar.git",
     revision: "6d73e2eb4dcf53690545cb9967b431df115318e2"
  version "6d73e2e"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/droidstar-6d73e2e"
    sha256 cellar: :any,                 ventura:      "29b8eaccf64f7a2d0af3439aec7f32b54b576a21a65e94d3c1e933bdb5c74309"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "53a088e756816bef25b782a35fb58f6d27f49f446cd7acd82bb8cc938e394ffe"
  end

  depends_on "imbe_vocoder"
  depends_on "qt@5"

  def install
    system "qmake", "LIBS=-L#{HOMEBREW_PREFIX}/lib", "INCLUDEPATH=#{HOMEBREW_PREFIX}/include"
    system "make"
    if OS.mac?
      prefix.install "DroidStar.app"
      bin.write_exec_script prefix/"DroidStar.app/Contents/MacOS/DroidStar"
    end
    bin.install "DroidStar" if OS.linux?
  end

  test do
    # this is just for me go away
    system "true"
  end
end
