class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.16/zl-aarch64-macos-none.tar.gz"
      sha256 "08c5f1421e8573902515befeaf481aed35dcc5d61fba894bf858b7205af6186b"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.16/zl-x86_64-macos-none.tar.gz"
      sha256 "9c387bfe0d67979f0729081d3412532fc1f01a114a01dccdcc79e8e3bb3ec849"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.16/zl-aarch64-linux-gnu.tar.gz"
      sha256 "e9f9de6ad27004d5005566e37b3b346e55bc5e9506e720c2f603a7631e650cdf"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.16/zl-x86_64-linux-gnu.tar.gz"
      sha256 "1b9d20aade4c77a77b935ca2f76c4db44ee7a2cfd340842fa05eec598b29e01c"
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
