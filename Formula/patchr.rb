class Patchr < Formula
  desc "Browser diff review loop for coding agents"
  homepage "https://github.com/phongndo/patch"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.2.0/patchr-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "65ff5ac638d2173255412bc1f0fe3f517f6dd1395b4c0f8018d50fed2fb4525f"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.2.0/patchr-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "18069c32b30712b895a73dc6742f46543fa3ed871b2ae63e0b252e7d94637bf4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.2.0/patchr-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "57689d638892dcd2ddea5e58846dc6aa7696cd438ec939b19ff582bfb957e261"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.2.0/patchr-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "03d8d93c34d03578435906aed1ffc099e98826c8b7574a9d153ec745dd6ae817"
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
