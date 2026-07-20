class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.5/zl-aarch64-macos-none.tar.gz"
      sha256 "fb67ef8afce30ac0b66ab023a30e2ae43ea084c107cdeca3fc84913958f0ba28"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.5/zl-x86_64-macos-none.tar.gz"
      sha256 "8b6645722697eb1669b5d32ca73d1348c97fdf2f3b81765b4fb8b1972637b990"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.5/zl-aarch64-linux-gnu.tar.gz"
      sha256 "70a98ed2a4f246f3188174eb068137a4a4f79ad84836b7bc5ccb19a07e224696"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.5/zl-x86_64-linux-gnu.tar.gz"
      sha256 "862269f90633d2cf8837a343d8ef83e607432931c3d66c72b9780ef80b38aa4e"
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
