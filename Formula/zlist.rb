class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.7/zl-aarch64-macos-none.tar.gz"
      sha256 "ec99ed72f34b172c244d5170ab7e3ded54930ea7e7fa1691c3706c16a4332e70"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.7/zl-x86_64-macos-none.tar.gz"
      sha256 "3f7aae080fe66dcbbdbe7e87dc1f4e2ecd8ddea2409009c2db1a13bf57a71016"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.7/zl-aarch64-linux-gnu.tar.gz"
      sha256 "589f340010796f1d8d404cc890578ebf042aaf5cb2dfac3dd8e1dc8411683e6d"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.7/zl-x86_64-linux-gnu.tar.gz"
      sha256 "9f30df763dff8da935d86935526d050d3fe1d8b63f729764a3ddab1d30f691d3"
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
