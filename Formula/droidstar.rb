class Droidstar < Formula
  desc "Multi-mode ham digital voice client"
  homepage "https://github.com/nostar/DroidStar"
  url "https://github.com/nostar/DroidStar.git",
     revision: "6d73e2eb4dcf53690545cb9967b431df115318e2"
  version "6d73e2e"
  license "GPL-2.0-or-later"

  depends_on "imbe_vocoder"
  depends_on "qt@5"

  def install
    system "qmake", "LIBS=-L#{HOMEBREW_PREFIX}/lib", "INCLUDEPATH=#{HOMEBREW_PREFIX}/include"
    system "make"
    prefix.install "DroidStar.app"
    bin.write_exec_script prefix/"DroidStar.app/Contents/MacOS/DroidStar"
  end

  test do
    # this is just for me go away
    system "true"
  end
end
