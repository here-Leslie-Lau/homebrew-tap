class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.17/zl-aarch64-macos-none.tar.gz"
      sha256 "d5eda5a196c1ef8b454b161b8111483376cae200ed9245e483143bcf2420a515"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.17/zl-x86_64-macos-none.tar.gz"
      sha256 "809c4227acc2b6d023c5c24f610b3cb289dfb3c7b0256e7a787f2c60fa9f18b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.17/zl-aarch64-linux-gnu.tar.gz"
      sha256 "d060aea2320d7c831e70ac296762a8f4f150033ad93f50b0effeaca6dcd1bf4b"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.17/zl-x86_64-linux-gnu.tar.gz"
      sha256 "eeb5837eb353990d744077ded5fbd6f7a4ee18ed8154a6bbfa58539cc7be2970"
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
