class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.13.0/mark-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "31670fe1f25f04662e5b164454ff84fe6172ca7b774fd3916e3a860f9be30520"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.13.0/mark-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "123d56a396e4ff7443606f35f1c5a25bb5da6927c9a8de0dae7f527bb3a61126"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.13.0/mark-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbb89e91802fc31ba77a40c46ddcb620e65779ed6144977f5ec2adb417fdeb3c"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.13.0/mark-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9fda1531d0881eb3ed2d76aff6eb17bece8cd4baee161ea0d93c8d7669da0f6"
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
