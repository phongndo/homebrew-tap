class Leetvim < Formula
  desc "LeetCode in your terminal, solved in your own vim"
  homepage "https://github.com/phongndo/leetvim"
  version "0.1.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.1/leetvim-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "00111bd2f6203e590bba1d6710468d8ecd48a1e2a414a817ffcf42c29ac70f40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.1/leetvim-v0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1cd45784eeb30b228fac0a47d50d4dc6440a69a9eb34d70f1fd7f9a0a94e4199"
    end

    on_intel do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.1/leetvim-v0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "791ec35f637d9b08070be395e3646177d78411d52c003f6768531a787c04868d"
    end
  end

  def install
    bin.install "bin/leetvim"
    doc.install Dir["share/doc/leetvim/*"]
  end

  test do
    assert_match "leetvim #{version}", shell_output("#{bin}/leetvim --version")
    assert_match "leetvim/config.toml", shell_output("#{bin}/leetvim config")
  end
end
