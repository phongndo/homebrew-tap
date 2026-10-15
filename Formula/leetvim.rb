class Leetvim < Formula
  desc "LeetCode in your terminal, solved in your own vim"
  homepage "https://github.com/phongndo/leetvim"
  version "0.1.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.2/leetvim-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "350a62e324fc99643567c3acdd16a4b5c53423fdeb1cdfad331fb4f5a595e563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.2/leetvim-v0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7b8964925a4baa08ced8a0ddf93f42d9f22683e8eb16c6d88908b9d538703644"
    end

    on_intel do
      url "https://github.com/phongndo/leetvim/releases/download/v0.1.2/leetvim-v0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2670bac74b8c978b60fa996aae31e990732d4598910e90e75a709834db7dfe1f"
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
