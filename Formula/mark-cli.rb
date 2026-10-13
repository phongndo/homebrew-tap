class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.15.0/mark-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "97311dda0820bce7330c83f9d8a1523922717bb190f767f848e9a28b9b9ea536"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.15.0/mark-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "29d630c3314245584f53a9e3d75da1f959d54ebf48f3db12483b4cc8028c423d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.15.0/mark-v0.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be0c775cfbad572424e73ea835161bb2292878a9c00ebb29de74dcac19f3caca"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.15.0/mark-v0.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "381c8ace6ae0f36ac28841402ffab43be076e33ce1e867ac11903a1c7ff98eca"
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
