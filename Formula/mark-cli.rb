class MarkCli < Formula
  desc "Fast, keyboard-first terminal Git diff reviewer"
  homepage "https://github.com/phongndo/mark"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.14.1/mark-v0.14.1-x86_64-apple-darwin.tar.gz"
      sha256 "e7cf52ea4040ad36a767476cfded96575c7181659153ccd9c3952640e4ebd609"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.14.1/mark-v0.14.1-aarch64-apple-darwin.tar.gz"
      sha256 "ab86e665f80b0019915deb9db10f17c9bf68dd23b03f41765523d8d2b02953a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/phongndo/mark/releases/download/v0.14.1/mark-v0.14.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a60db76922b56cafed077de15e2f8f06dfdaeb81c48ba1ca172ee3f4c0056a9a"
    end

    on_arm do
      url "https://github.com/phongndo/mark/releases/download/v0.14.1/mark-v0.14.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "892b00611197d055856f130749820622a9f4a84b641c6f4f54479f19bf6b131e"
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
