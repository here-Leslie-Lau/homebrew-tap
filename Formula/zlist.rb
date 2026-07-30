class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.9/zl-aarch64-macos-none.tar.gz"
      sha256 "5eb520ebd0ed2471d9aa14e838230cdd4257c6480176d251abdadc8af20c19c1"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.9/zl-x86_64-macos-none.tar.gz"
      sha256 "23833adabaf43848535a8b03cea582f2dc9a71df6ca7ca959765e5936f50f1b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.9/zl-aarch64-linux-gnu.tar.gz"
      sha256 "2b0902c7ea4757b6c0f79d464cfd9898c9b4083d13067cd2f59b60f90fc68e87"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.9/zl-x86_64-linux-gnu.tar.gz"
      sha256 "c58c2b542fff7ccc78eb6add7177fec2e795482c164c4970d5614fadaacad668"
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
