class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.16.0/mark-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a17a7781c0175bb139085178185fb6b713b1b44fb001f768bfbbdbd0326ab4b"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.16.0/mark-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "b547083f4246ae4df0ea563af6ec43d49f49ca37a9480e61e6f51d55eeea7856"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.16.0/mark-v0.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "397b3d0bafc388b986e1a7502d4a5995ea9063657efbbdaf9ea0f37a53c715b9"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.16.0/mark-v0.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b7c106e948d9c41fd1b106ff0d996f1cbe36745f546e709c623c60363625e24"
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
