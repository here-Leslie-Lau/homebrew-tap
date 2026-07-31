class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.10/zl-aarch64-macos-none.tar.gz"
      sha256 "3a34afb605c64857546142fe00c6a06851dbb8d84ff0e695ac1fc7827349e635"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.10/zl-x86_64-macos-none.tar.gz"
      sha256 "c096632bfe963412a5c0790144e42e95e4b275ab58b77d97d26d9108537f2652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.10/zl-aarch64-linux-gnu.tar.gz"
      sha256 "5633cd5ca5f9e7407ac80d0b2d424ca4fe0cc54284a723243f50f280f92df886"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.10/zl-x86_64-linux-gnu.tar.gz"
      sha256 "af8e61459bdc64f306705d0121845a882c7132bdb64c5f7bcd8a2349f3e67dcf"
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
