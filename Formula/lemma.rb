class Lemma < Formula
  desc "Extensible coding-agent harness with a web app and CLI"
  homepage "https://github.com/phongndo/lemma"
  version "0.1.0"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.0/lemma-v0.1.0-darwin-arm64.tar.gz"
      sha256 "0f0fc990d23e9ae84e689548ac7381b67b699d5337a20b6cfbe62b68ec52781a"
    end
    on_intel do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.0/lemma-v0.1.0-darwin-x64.tar.gz"
      sha256 "9113f7bef140b6865a54bd38d27b5d86efaf689c6f03b8965e5e9a412db4a863"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.0/lemma-v0.1.0-linux-arm64.tar.gz"
      sha256 "842d78ccdbc7dd4f389b11affa4eb82009dcf0566bd263f22d268a85fd61ce72"
    end
    on_intel do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.0/lemma-v0.1.0-linux-x64.tar.gz"
      sha256 "7daf300597f0266e8ff57622b6409b6542eaca58aeda507e786748356ed1dba5"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/lemma"
  end

  test do
    assert_match "lemma #{version}", shell_output("#{bin}/lemma --version")
    assert_match "Usage: lemma", shell_output("#{bin}/lemma --help")
  end
end
