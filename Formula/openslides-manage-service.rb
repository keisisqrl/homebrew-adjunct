class OpenslidesManageService < Formula
  desc "OpenSlides Management Client"
  homepage "https://github.com/openslides/openslides"
  url "https://github.com/OpenSlides/openslides-manage-service/archive/refs/tags/4.0.9.tar.gz"
  sha256 "c50bb61c3840da969374a92d9797895de3d0c62017370d22fea7f33a1142988b"
  license "MIT"

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

