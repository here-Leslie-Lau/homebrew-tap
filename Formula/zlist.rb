class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.14/zl-aarch64-macos-none.tar.gz"
      sha256 "5bddf8e316f0adcb9c122fd745391cb83cf2b304d319347c1b155b6cb0150a89"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.14/zl-x86_64-macos-none.tar.gz"
      sha256 "9e3566a5df03e6ad46beaad82bb0e472aa3368e691f913ec2c8dc1aab26d9c9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.14/zl-aarch64-linux-gnu.tar.gz"
      sha256 "25b754cbb39ad240768b1ba5b09e5f381220ea9e9c29353019319b9c8d0fa3f9"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.14/zl-x86_64-linux-gnu.tar.gz"
      sha256 "edd7f6df264b2b7dec2546084292b271a5ba783434e2258261405797a080e897"
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
