class Frame < Formula
  desc "Fast, extensible terminal multiplexer"
  homepage "https://github.com/phongndo/frame"
  version "0.1.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/phongndo/frame/releases/download/v0.1.0/frame-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "114f9a66780ec30501268c9aabae23e3b3b58d42a320c7d428fd024e726a8bbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/frame/releases/download/v0.1.0/frame-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8d18b74011f4dbae47e4046f2699e4f3ed26fbabb3fb169d81b7521e04c3fbc"
    end

    on_intel do
      url "https://github.com/phongndo/frame/releases/download/v0.1.0/frame-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cddf02e0bf20f8efc6046afa8de77d39a1779c5f14da8212575acd957322797e"
    end
  end

  def install
    bin.install Dir["bin/*"]
    share.install Dir["share/*"]
  end

  test do
    ENV["XDG_CONFIG_HOME"] = testpath/"config"
    ENV["FRAME_DEV_RUNTIME_DIR"] = testpath
    ENV["FRAME_DEV_BUILD_ID"] = "0" * 64
    assert_match "frame #{version} ", shell_output("#{bin}/frame --version")
    system bin/"frame", "config", "check"
    started = shell_output("#{bin}/frame session start brew-test --hold -- /bin/sh -c 'printf FRAME_BREW_OK'")
    pane = JSON.parse(started).fetch("results").first.fetch("result").fetch("pane")
    begin
      system bin/"frame", "wait", "--session", "brew-test", "--pane", pane, "--exit-code", "0", "--timeout", "10s"
      assert_match "FRAME_BREW_OK", shell_output("#{bin}/frame capture --session brew-test --pane #{pane}")
    ensure
      system bin/"frame", "kill", "brew-test"
    end
  end
end
