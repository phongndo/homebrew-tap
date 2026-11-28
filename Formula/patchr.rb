class Patchr < Formula
  desc "Review your coding agent's changes in the browser"
  homepage "https://github.com/phongndo/patch"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.3.2/patchr-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "89e78b70fcfce2d04ae4d49fd52f4eb815c21b5feba2fe64c289cbdc93b995d8"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.3.2/patchr-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "68ff83073142a048f24c5327e002616961ab8470e836948815385e10e7f1bd3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.3.2/patchr-v0.3.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fe775179ee9991a846de66178465298d0c79b7f9ff23f7ef795aaf92d627a1ac"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.3.2/patchr-v0.3.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8531a551331ff6f0dad753164377456ec47fc2a752e143bddb734477c8604f09"
    end
  end

  def install
    bin.install "patchr"
  end

  def caveats
    <<~EOS
      Add /patch to your coding agents with:
        #{opt_bin}/patchr install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patchr --version")
  end
end
