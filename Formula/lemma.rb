class Lemma < Formula
  desc "Agent harness in which every part is a plugin"
  homepage "https://github.com/phongndo/lemma"
  version "0.2.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :ventura

    on_arm do
      url "https://github.com/phongndo/lemma/releases/download/v0.2.0/lemma-v0.2.0-darwin-arm64.tar.gz"
      sha256 "aa7917ab3e502191be9770f9b951dbc5c9c3eebe0f6a79e44391709451efa899"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/lemma/releases/download/v0.2.0/lemma-v0.2.0-linux-arm64.tar.gz"
      sha256 "22bf98f616542c6ba7fa50d15a5935ca1b82c5416474439f70b70cc48075dda2"
    end

    on_intel do
      url "https://github.com/phongndo/lemma/releases/download/v0.2.0/lemma-v0.2.0-linux-x64.tar.gz"
      sha256 "47b4a321e99b11885620adc5ac466157ecc8bb44a2fdd45b1c7fe1ca2be8e4dc"
    end
  end

  def install
    libexec.install Dir["*"]
    # On macOS, Homebrew gives each library in a keg its own path as its ID, which a
    # prebuilt one with no room in its header for a longer ID refuses (fff's file
    # search): the libraries go in after it has, in its post-install steps.
    libraries = OS.mac? ? libexec.glob("**/*.dylib").select { |library| library.realpath == library } : []
    unless libraries.empty?
      relative = libraries.map { |library| library.relative_path_from(libexec) }
      system "tar", "-cf", libexec/"libraries.tar", "-C", libexec, *relative
      libraries.each(&:unlink)
    end
    # What installed it: lemma update updates it with brew, and runs the lemma Homebrew links.
    (libexec/"install.json").write <<~JSON
      {"installer": "homebrew", "link": "#{HOMEBREW_PREFIX}/bin/lemma", "manager": "#{HOMEBREW_PREFIX}/bin/brew"}
    JSON
    bin.install_symlink libexec/"bin/lemma"
  end

  post_install_steps do
    on_macos do
      if_path_exists "libraries.tar", base: :libexec do
        run "/usr/bin/tar", args: ["-xf", "{{libexec}}/libraries.tar", "-C", "{{libexec}}"]
        remove "libraries.tar", base: :libexec
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lemma --version")
  end
end
