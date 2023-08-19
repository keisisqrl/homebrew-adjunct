class OpenslidesManageService < Formula
  desc "OpenSlides Management Client"
  homepage "https://github.com/openslides/openslides"
  url "https://github.com/OpenSlides/openslides-manage-service/archive/refs/tags/4.0.0.tar.gz"
  sha256 "d67ca416ef01ee7845dc7df4aae1b5c1ee808174019f92021ecf4cc10bde93f1"
  license "MIT"

  depends_on "go" => :build

  def install
    system "make", "go-build"
    bin.install "openslides"
  end

  test do
    assert_match "openslides is an admin tool", shell_output("#{bin}/openslides").strip
  end
end
