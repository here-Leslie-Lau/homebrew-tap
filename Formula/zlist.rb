class Zlist < Formula
  desc "Modern ls alternative written in Zig"
  homepage "https://github.com/here-Leslie-Lau/zlist"
  license "MIT"

  # Use the prebuilt release archive matching the user's platform.
  on_macos do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.13/zl-aarch64-macos-none.tar.gz"
      sha256 "817a33a955f7193de774b392925837a1037a91ad1d88ffe72d0e363610b5c2fb"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.13/zl-x86_64-macos-none.tar.gz"
      sha256 "89274243a8583b42db5eb60f2407b88a6837c8cff9adce65cd049a740ccb9880"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.13/zl-aarch64-linux-gnu.tar.gz"
      sha256 "7919657dc939cd90eb72b816bcbc7c5d600fddfa9b0b82bebf894ae7901b8d11"
    end

    on_intel do
      url "https://github.com/here-Leslie-Lau/zlist/releases/download/v0.1.13/zl-x86_64-linux-gnu.tar.gz"
      sha256 "8fb66a8f1e5a0d0411631f44e765d798fa23431a5eb1c6ac4c40e4b72ab8e001"
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
