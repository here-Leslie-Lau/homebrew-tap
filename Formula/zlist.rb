class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.11/zl-aarch64-macos-none.tar.gz"
      sha256 "84bdcf7ba38c75e99adf2f36317ff9f85ce8eff0abf1d7b69cc491038c4dce1f"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.11/zl-x86_64-macos-none.tar.gz"
      sha256 "c7a4ef24511ad56c8bb34d071a071a7fd36bb8c8ca6e48bee34a7fc2b4a35d85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.11/zl-aarch64-linux-gnu.tar.gz"
      sha256 "c99370840356aa282d9912bddacef9f017d796bb10276d4ba02be13550c93aca"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.11/zl-x86_64-linux-gnu.tar.gz"
      sha256 "546e1f45d3875afd4070fd0fcbcb9bb7c5af6044c4c8ce9a37644077bd630ca1"
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
