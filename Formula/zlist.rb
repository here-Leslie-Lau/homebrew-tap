class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.1/zl-aarch64-macos-none.tar.gz"
      sha256 "8a6195527dcd5c51a3249d48c79cbf4bcca0b41691b8eb74e4d388935ec0ace0"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.1/zl-x86_64-macos-none.tar.gz"
      sha256 "b64e2149c2a72baa219291704e4a759ed3119313e63ad6fa50f1b1d5b9912754"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.1/zl-aarch64-linux-gnu.tar.gz"
      sha256 "ac7e142512a00ea1267630e9c202b6f09248d5d90a5967e78e17f84472c5a843"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.1/zl-x86_64-linux-gnu.tar.gz"
      sha256 "489dfda3acc92ce0b33e1df75c434723310172f218e626e2025503c5e82ee9fe"
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
