class ImbeVocoder < Formula
  desc "IMBE library from osmocom OP25"
  homepage "https://github.com/nostar/imbe_vocoder"
  url "https://github.com/nostar/imbe_vocoder.git",
    revision: "03423cb00b8e9ba1be164493e8b98b5bd7c1508c"
  version "03423cb"
  # sha256 ""
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/imbe_vocoder-03423cb"
    sha256 cellar: :any_skip_relocation, ventura:      "66f8db5104695251d4cb44923da497c1521b771ab359dba71288fe89d4a5f5b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8a2fd4720b3b230490413155e179ed18bec642c9557b62120ef06769fc5c00a0"
  end

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
