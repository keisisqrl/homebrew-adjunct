class OpenslidesManageService < Formula
  desc "OpenSlides Management Client"
  homepage "https://github.com/openslides/openslides"
  url "https://github.com/OpenSlides/openslides-manage-service/archive/refs/tags/4.0.9.tar.gz"
  sha256 "c50bb61c3840da969374a92d9797895de3d0c62017370d22fea7f33a1142988b"
  license "MIT"

  bottle do
    root_url "https://github.com/keisisqrl/homebrew-adjunct/releases/download/openslides-manage-service-4.0.9"
    sha256 cellar: :any_skip_relocation, ventura:      "d16ffd547242030d57128ae219bb72ee9645332b8d74e1711a426854161935ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1ad06d779b3e13a4021630afcadc9da84c15a8b0f51d271d556d71aa6a6ec18b"
  end

  depends_on "go" => :build

  # The client "isn't version aware" so...
  patch :DATA

  def install
    system "go", "build", *std_go_args(output: bin/"openslides"), "./cmd/openslides"
  end

  test do
    assert_match "openslides is an admin tool", shell_output("#{bin}/openslides").strip
  end
end
__END__
diff --git a/pkg/config/default-config.yml b/pkg/config/default-config.yml
index a4e2d49..749c34f 100644
--- a/pkg/config/default-config.yml
+++ b/pkg/config/default-config.yml
@@ -15,7 +15,7 @@ enableAutoHTTPS: false
 # Defaults for all OpenSlides services.
 defaults:
   containerRegistry: ghcr.io/openslides/openslides
-  tag: latest
+  tag: 4.0.9
 
 # These environment variables are injected into every OpenSlides service
 # via YAML merge type (https://yaml.org/type/merge.html).

