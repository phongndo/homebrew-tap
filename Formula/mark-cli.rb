class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.14.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.14.2/mark-v0.14.2-x86_64-apple-darwin.tar.gz"
      sha256 "b75dd1300c8442cc7b94deda95cb7f8c8f502549e4e5bfdc13c2b8ad990a3ecb"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.14.2/mark-v0.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "2da0bc0d5a5a34b8f28d9e8699705cc5ac154bee8dc5d3a515356c3a10fa9a73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.14.2/mark-v0.14.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2150e8088582ecf383edaa536efe775e4176730017fa02ee3221461d05a1a9e4"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.14.2/mark-v0.14.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "15115b701e8489c7a44d34f8adb4085f5afa8765dbc3fea33f6b04ad21a86389"
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
