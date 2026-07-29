class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.8/zl-aarch64-macos-none.tar.gz"
      sha256 "bf144032c72fca77e16248388c3ee903a1c685b543642c9da17eec53a534540a"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.8/zl-x86_64-macos-none.tar.gz"
      sha256 "7b5f7cc1a9889ea0408275c6d44160b58387ea93c347160ec58a85723945242d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.8/zl-aarch64-linux-gnu.tar.gz"
      sha256 "d943d155c3c66d9e9692f9d9a6b55ccd7c0327b2a2f3460c08e44327f5570f48"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.8/zl-x86_64-linux-gnu.tar.gz"
      sha256 "6821c424e2fd6bd79af892d689c5117233f77f914cd7f42703e2e7a5ab1542c6"
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
