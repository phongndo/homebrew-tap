class Patchr < Formula
  desc "Review your coding agent's changes in the browser"
  homepage "https://github.com/phongndo/patch"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.3.1/patchr-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "f52d8f33e053be2e4837bac6cd074f31d0c92f7b292d14e481168ffc75edcf5f"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.3.1/patchr-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "e82f2af4e37c6a3637b61b8af646231eec11d1959ead5a773828ccb22d14bbcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/patch/releases/download/v0.3.1/patchr-v0.3.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "030172739ad7206535010fd896ce6338db68d0c7a9fbded160e04905c50ae5a7"
    end
    on_intel do
      url "https://github.com/phongndo/patch/releases/download/v0.3.1/patchr-v0.3.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4aba2ede483024c7c7312d46ccebf1c8a0b4ca8cd837e67824810265f87e5766"
    end
  end

  def install
    bin.install "patchr"
  end

  def caveats
    <<~EOS
      Add /patch to your coding agents with:
        #{opt_bin}/patchr install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/patchr --version")
  end
end
