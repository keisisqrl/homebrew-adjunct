class Sqlar < Formula
  desc "SQLite Archiver"
  homepage "https://www.sqlite.org/sqlar/doc/trunk/README.md"
  url "https://www.sqlite.org/sqlar/zip/4824e73896/sqlar-src-4824e73896.zip"
  version "2018-01-07"
  sha256 "73be4d0bea2a4ade4e0e05bb256f1226e87b11a798ae456c0c3c8831a7b99151"
  license "BSD-2-Clause"

  uses_from_macos "zlib"

  def install
    system "make", "sqlar"
    bin.install "sqlar"
    doc.install "README.md"
  end

  test do
    system "#{bin}/sqlar", "test-archive", "#{doc}/README.md"
    assert_match "README.md", shell_output("#{bin}/sqlar -l test-archive")
  end
end
