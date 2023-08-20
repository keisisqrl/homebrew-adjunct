class Noteshrink < Formula
  include Language::Python::Virtualenv

  desc "Convert scans of handwritten notes to beautiful, compact PDFs"
  homepage "https://github.com/mzucker/noteshrink"
  url "https://files.pythonhosted.org/packages/13/a3/95c92cd5c250d3eb21ced23d1a7d1dabb1546e565fa4cdeaa72586ef871e/noteshrink-0.1.1.tar.gz"
  sha256 "f910667247aea13c7f0ba86d26a204d53d8c4246ae5fb50214c72c52af362588"
  license "MIT"

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/noteshrink-0.1.1"
    sha256 cellar: :any_skip_relocation, ventura:      "0924e2cd6fa6d39dcb573fc5cc5c61ca7380d022818f651d8e9121f39208860b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d41c0c124466b370bb6c4ca127f55aee3a9a10c7052c15d8d404320af7511df2"
  end

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
