class Patchr < Formula
  desc "Browser diff review loop for coding agents"
  homepage "https://github.com/phongndo/patch"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.1.1/patchr-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "c2698295ff225ea9e14dbcf69980c9a875a1c28aa9a23ee7e85b2d06a08503ab"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.1.1/patchr-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "7224564c2a379a9ab1044015caa9c6efa23a21dee020eac4e162f0bd574ab717"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.1.1/patchr-v0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ad6fb4e0e856b46452c290827e137c4487e61da9c9f241ea2e12810bf4d0d8f8"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.1.1/patchr-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c516c0624b7b275863820df8e76871cd6ca5260060697b963e7a333e260469d8"
    end
  end

  def install
    bin.install "patchr"
  end

  def caveats
    <<~EOS
      Add /patch to your agent harnesses with:
        #{opt_bin}/patchr install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patchr --version")
  end
end
