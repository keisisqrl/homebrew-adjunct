class OpenslidesManageService < Formula
  desc "OpenSlides Management Client"
  homepage "https://github.com/openslides/openslides"
  url "https://github.com/OpenSlides/openslides-manage-service.git",
    revision: "e4fc8ef5c77d4a3dbabf217e131b68c956bf8f04"
  version "4.0.6"
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
+  tag: 4.0.6
 
 # These environment variables are injected into every OpenSlides service
 # via YAML merge type (https://yaml.org/type/merge.html).

