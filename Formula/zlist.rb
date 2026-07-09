class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.3/zl-aarch64-macos-none.tar.gz"
      sha256 "a1dbc73b7ab4f3415c55271cf0f1b6b82fa8f7277c38dc91f791e9d7ff00a1b1"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.3/zl-x86_64-macos-none.tar.gz"
      sha256 "748e9c3f5d7edbdaecaec4c660f0e70883acfe456a424ecfd9f1ad1fd36083c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.3/zl-aarch64-linux-gnu.tar.gz"
      sha256 "c50c3c0d417f36963b309875d21b3ef55a4245240355076075e8afd97f77c26f"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.3/zl-x86_64-linux-gnu.tar.gz"
      sha256 "da94d89aa461b7de4360e768fe345029fa46cbc2b308dca8bd22dedb7f208141"
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
