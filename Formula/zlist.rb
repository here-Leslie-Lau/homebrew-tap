class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.15/zl-aarch64-macos-none.tar.gz"
      sha256 "efd90b3539ac91665453fc50a96f49e787b5a9b9758e117b1698ed1f8e591d05"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.15/zl-x86_64-macos-none.tar.gz"
      sha256 "9521644862038e160ba65850ef01caf9c8a2c6c6b999458dbe4fafc035a09850"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.15/zl-aarch64-linux-gnu.tar.gz"
      sha256 "4d4c877a0b31de3a33b97cf6b1dfb424960748dd7d40d61f0118554b4664214f"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.15/zl-x86_64-linux-gnu.tar.gz"
      sha256 "41b8592e987c20e74b2ac022a8c48b48f6796d4ee1b152d4ca7d9c07fb12d157"
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
