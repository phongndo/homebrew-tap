class Hz < Formula
  desc "Fast terminal workflow for parallel development with agents"
  homepage "https://github.com/phongndo/hz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/hz/releases/download/v0.1.9/hz-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "3f5667bcb47f495390f9e73abae1b3fadd677ebd3694c4fe601955c65ded400f"
    end

    on_intel do
      url "https://github.com/phongndo/hz/releases/download/v0.1.9/hz-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "fa97bac679fe43786c4cf66e0e7270e7934d392f99415061b396eab85a85e492"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/hz/releases/download/v0.1.9/hz-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f07e4569b1fd9e239f017ee2c8930bd28ff0cdc91728a52950c21bd982cee8a"
    end

    on_intel do
      url "https://github.com/phongndo/hz/releases/download/v0.1.9/hz-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a6d34b0112c8fe6d048df62c416d56832fd59842acd53886afe3ad76b32a34c"
    end
  end

  def install
    bin.install "hz"
  end

  def caveats
    <<~EOS
      To enable shell integration and completions, run one of:
        hz install zsh
        hz install bash
        hz install fish
    EOS
  end

  test do
    assert_match "hz #{version}", shell_output("#{bin}/hz --version")
  end
end
