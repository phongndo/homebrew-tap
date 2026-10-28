class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.16.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.16.1/mark-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "35756fa41d8ac4afe3edbaf08a7089d89443a1feea1d71a62c2886d46b0f78f8"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.16.1/mark-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "2570099c6f256aec67251aa4d918f3bbfa0f74ad07b041ca6d8ac0f69d0c2a51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.16.1/mark-v0.16.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8621c002b897d07ced57df0c56dfb6d8cd94f411efd90fdfd96609209c0e40f6"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.16.1/mark-v0.16.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a45e11aac0a9a86f75dd0c868b40b9bbca6b3feccb5737f5df786ee6e14c9510"
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
