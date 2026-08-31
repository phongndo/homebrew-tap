class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.14.0/mark-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "aec5b711852ab20dc91cadb048b8b8cffe553274d84aa4c3eaf0954706827928"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.14.0/mark-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "b946b25d0d7f96eae769f1cca77a41aa51103c308cab8e94e5207573559f31de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.14.0/mark-v0.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29313e5ba70b38dcf2750cb2ec94c3d0483bcf35717d02a5f18f3bfa4b468184"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.14.0/mark-v0.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c0830eb6c2359f78b976da99f9c1fe0516597431580b7f07aea531a4c646968"
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
