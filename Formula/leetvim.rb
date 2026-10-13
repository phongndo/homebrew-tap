class Leetvim < Formula
  desc "LeetCode in your terminal, solved in your own vim"
  homepage "https://github.com/phongndo/leetvim"
  version "0.1.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.0/leetvim-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ee64f941672d2c967842d6f689e7f205723e513f309ceb7c51eb3071afae436a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.0/leetvim-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b0bfdd2e243e2ab91d1c95e27090a1e45bc84f23b65265dd987c415411c83041"
    end

    on_intel do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.0/leetvim-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0a2c020de7da81b234532c141e2f98f3e0fadc9e736b7af727deaab468a3683e"
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
