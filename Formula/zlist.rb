class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.2/zl-aarch64-macos-none.tar.gz"
      sha256 "efb70e44119c630f5575258797d842834d412f32ac956c9303f729436d6d6616"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.2/zl-x86_64-macos-none.tar.gz"
      sha256 "995ec03ce4ed635d64bf4cc0be7f7a73daa20b041a6b9ffdf5dee1acc5ab9975"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.2/zl-aarch64-linux-gnu.tar.gz"
      sha256 "eedd05cf2869f9b09b57cb4f48206dd00402e7cb733e5a95f00f1c5e3b43dd57"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.2/zl-x86_64-linux-gnu.tar.gz"
      sha256 "a02fdee7283d6d050f568db51af3d3e838a8b10dde3df7adf1e2fcbb64f288c7"
    end
  end

  def install
    # Release archives contain one target-suffixed binary, e.g. zl-aarch64-macos-none.
    bin.install Dir["zl-*"].first => "zl"
  end

  test do
    # Exercise the real listing path instead of only checking --help.
    (testpath/"sample.txt").write("")
    assert_match "sample.txt", shell_output("#{bin}/zl --pure #{testpath}")
  end
end
