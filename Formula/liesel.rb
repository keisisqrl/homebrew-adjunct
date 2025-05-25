class Liesel < Formula
  desc "Prepares PDFs to be home-printed as booklets"
  homepage "https://github.com/rail5/liesel"
  url "https://github.com/rail5/liesel/archive/refs/tags/v11.3.8.tar.gz"
  sha256 "68fd84e2798136288ca186fa08fe9cccee988df4e21819afb97b407794b9d832"
  license "GPL-3.0-only"

  depends_on "fontconfig"
  depends_on "graphicsmagick"
  depends_on "libharu"
  depends_on "poppler"

  def install
    system "make"
    bin.install "liesel"
  end

  test do
    system "#{bin}/liesel", "-h"
  end
end
