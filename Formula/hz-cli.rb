class HzCli < Formula
  desc "Copy-on-write workspaces for parallel humans and agents"
  homepage "https://github.com/phongndo/hz"
  version "0.10.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sonoma

    on_arm do
      url "https://github.com/phongndo/hz/releases/download/v0.10.0/hz-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "4c7194f6d0bb01c7d6651374cc09327f491a3367f15fdff937bda22babb8fb63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/hz/releases/download/v0.10.0/hz-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ab3a25da04dae82dae9dde7b87e7ea27b9df93b49c1d4f969f67c47cdbc3b370"
    end

    on_intel do
      url "https://github.com/phongndo/hz/releases/download/v0.10.0/hz-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "de787f8b19916579beca69b8ebd915ee54e67f2f0916b1a0f543dd92a7ebc3df"
    end
  end

  conflicts_with "hz", because: "both install an `hz` binary"

  def install
    bin.install "bin/hz"
    doc.install Dir["share/doc/hz/*"]
  end

  test do
    assert_match "hz #{version}", shell_output("#{bin}/hz --version")

    ENV["HZ_DATA_DIR"] = (testpath/"data").to_s
    (testpath/"app/README").write "hello"
    cd testpath/"app" do
      system bin/"hz", "init", "--copy"
      child = shell_output("#{bin}/hz new child --path-only").chomp
      assert_equal "hello", (Pathname(child)/"README").read
    end
  end
end
