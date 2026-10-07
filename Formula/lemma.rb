class Lemma < Formula
  desc "Extensible coding-agent harness with a web app and CLI"
  homepage "https://github.com/phongndo/lemma"
  version "0.1.1"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.1/lemma-v0.1.1-darwin-arm64.tar.gz"
      sha256 "eaf43eb1a49deca0a702a8d80db5da2f790f6637072bd4657def8b567c40d1e8"
    end
    on_intel do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.1/lemma-v0.1.1-darwin-x64.tar.gz"
      sha256 "0ab60f9fd350e3da48b4735dd0902889d8d3e125c9b823350fc753a4645bfc67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.1/lemma-v0.1.1-linux-arm64.tar.gz"
      sha256 "c69cb9e58afe294bce974566aab39fbad71c556caaafb885c8749fe12f0a8cc7"
    end
    on_intel do
      url "https://github.com/phongndo/lemma/releases/download/v0.1.1/lemma-v0.1.1-linux-x64.tar.gz"
      sha256 "9c28cda9b23ed5d5a45e6f866a9863f1beb89b8858bd5352955bdc4e3fb743b3"
    end
  end

  # fff is loaded by filename through FFI; its upstream build ID has no room for a Cellar path.
  preserve_rpath

  def install
    libexec.install Dir["*"]
    if OS.mac?
      libexec.glob("node_modules/**/libfff_c.dylib", File::FNM_DOTMATCH).each do |library|
        change_dylib_id library, "@rpath/libfff_c.dylib"
      end
    end
    bin.install_symlink libexec/"bin/lemma"
  end

  test do
    assert_match "lemma #{version}", shell_output("#{bin}/lemma --version")
    assert_match "Usage: lemma", shell_output("#{bin}/lemma --help")
    (testpath/"project").mkpath
    cd libexec/"plugins/file-search-fff" do
      system libexec/"runtime/bin/node", "--input-type=module", "-e", <<~JS
        import { FileFinder } from "@ff-labs/fff-node";
        const opened = FileFinder.create({ basePath: #{(testpath/"project").to_s.to_json}, disableContentIndexing: true, disableMmapCache: true });
        if (!opened.ok) throw new Error(opened.error);
        opened.value.destroy();
      JS
    end
  end
end
