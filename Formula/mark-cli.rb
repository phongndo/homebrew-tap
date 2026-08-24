class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.13.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.13.2/mark-v0.13.2-x86_64-apple-darwin.tar.gz"
      sha256 "b600dd09135eef166c4ea65243587b87718a4dcb9aa2b31e23263f25b6707a6b"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.13.2/mark-v0.13.2-aarch64-apple-darwin.tar.gz"
      sha256 "2ac360853596132fe02f580d8150bf6ddcde8af54d3ebc2ee611ff7c291984f5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.13.2/mark-v0.13.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12b7bd24a2a524935d27c47a4f4d9cb5b6fc319684e93fbef27e4c07665a05e0"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.13.2/mark-v0.13.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15114823085b3b651f4f01bd02388edca834dd9cdc520d59b8a5c2f78ffc2a5d"
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
