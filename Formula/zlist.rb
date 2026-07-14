class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.4/zl-aarch64-macos-none.tar.gz"
      sha256 "eed271a55b8500a0237ab63d6579b45f92f1ebc533258f8700c9cd65239ea9fc"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.4/zl-x86_64-macos-none.tar.gz"
      sha256 "8475fc1751af021aa1f921112b8d89a77d58e06cbcf85fc6217e66caf3703a1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.4/zl-aarch64-linux-gnu.tar.gz"
      sha256 "5b4ab0360183bb9f09621ebf443230415490bf1b9aaec0ed8e1328057b49a52a"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.4/zl-x86_64-linux-gnu.tar.gz"
      sha256 "2edf0b3e438c039f47154ce2110fb6e5ae5693080caf5772bad02440cf126e79"
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
