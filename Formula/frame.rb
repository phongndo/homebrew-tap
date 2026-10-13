class Frame < Formula
  desc "Fast, extensible terminal multiplexer"
  homepage "https://github.com/phongndo/frame"
  version "0.2.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/phongndo/frame/releases/download/v0.2.0/frame-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "13c4f6966fa1514fd680fb1f3ece6d47c904a6aa1100ceaacec5014a75370723"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/frame/releases/download/v0.2.0/frame-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c1bf6cea302b1d48e680372ead14c9849347e9fc11c0f131e8ca3b129447814"
    end

    on_intel do
      url "https://github.com/phongndo/frame/releases/download/v0.2.0/frame-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca7850e2a2e5957f73e638379b946be167d44204d2c1a9bb9ebfbe35b4a55e1d"
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
