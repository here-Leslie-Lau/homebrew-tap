class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.12/zl-aarch64-macos-none.tar.gz"
      sha256 "25a18157e6a7d7c7dde19011dbf4a4c5fe694c3bf73a66c886640f4b0e14605c"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.12/zl-x86_64-macos-none.tar.gz"
      sha256 "185015fe65a85a73b039c31d3b135532c5dc3630c54e132c976a2dd40fca4a14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.12/zl-aarch64-linux-gnu.tar.gz"
      sha256 "82aa8216ae19200aefd0bb6d4059886596460ebcd4d13bca4a57d376dd65d384"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.12/zl-x86_64-linux-gnu.tar.gz"
      sha256 "e78889eb2ef018e454f5ada4b7335c2d71e739e3b5cdfcdf635d900fd43e36e6"
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
