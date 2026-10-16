class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.15.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.15.1/mark-v0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "954cd662a0f3c6cfbc72b5598fe56e7c0e98c30375a8446cc5aaa9267852bf24"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.15.1/mark-v0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "8485a309f56ee308db915cdae8eea758ee9f54afe38ee3da35bb83bba848e4de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.15.1/mark-v0.15.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf1163cb6358382e52920390075009db41c335a357829c3f228f4afb3fccf329"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.15.1/mark-v0.15.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7dceed5b9b41af12b5394086caac28ac0f531cd2b68560af3d0f00274e2b774"
    end
  end

  conflicts_with "mark", because: "both install a `mark` executable"

  def install
    bin.install "mark"
  end

  test do
    assert_match "mark #{version}", shell_output("#{bin}/mark --version")
  end
end
