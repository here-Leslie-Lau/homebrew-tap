class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.6/zl-aarch64-macos-none.tar.gz"
      sha256 "0d01f1ec6fe94a0cf091d8100f5e8896d2779e3bee4403ead136bf54637b918c"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.6/zl-x86_64-macos-none.tar.gz"
      sha256 "c34a39bfa0a7bfb377d25c077bf066a0182fd878de482c260afd90223b57f268"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.6/zl-aarch64-linux-gnu.tar.gz"
      sha256 "f0e7245501e7e05eac9db21095ccaca2611536134fe6a6026d3031065be36657"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.6/zl-x86_64-linux-gnu.tar.gz"
      sha256 "2437958a0707e52d2033418b6d655c702e049030e72eb2d5a9cee2be2a5115db"
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
