class ImbeVocoder < Formula
  desc "IMBE library from osmocom OP25"
  homepage "https://github.com/nostar/imbe_vocoder"
  url "https://github.com/nostar/imbe_vocoder.git",
    revision: "03423cb00b8e9ba1be164493e8b98b5bd7c1508c"
  version "03423cb"
  # sha256 ""
  license "GPL-3.0-or-later"

  def install
    system "make"
    lib.install "libimbe_vocoder.a"
    include.install "imbe_vocoder_api.h"
  end

  test do
    # I don't know man I can't test this
    system "true"
  end
end
