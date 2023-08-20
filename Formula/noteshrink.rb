class Noteshrink < Formula
  include Language::Python::Virtualenv

  desc "Convert scans of handwritten notes to beautiful, compact PDFs"
  homepage "https://github.com/mzucker/noteshrink"
  url "https://files.pythonhosted.org/packages/13/a3/95c92cd5c250d3eb21ced23d1a7d1dabb1546e565fa4cdeaa72586ef871e/noteshrink-0.1.1.tar.gz"
  sha256 "f910667247aea13c7f0ba86d26a204d53d8c4246ae5fb50214c72c52af362588"
  license "MIT"

  depends_on "imagemagick"
  depends_on "numpy"
  depends_on "pillow"
  depends_on "python"
  depends_on "scipy"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "convert scanned, hand-written notes to PDF", shell_output("#{bin}/noteshrink -h")
  end
end
