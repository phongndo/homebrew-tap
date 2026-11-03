class Alive2Mcp < Formula
  desc "MCP server and CLI for checking LLVM IR transformations with Alive2"
  homepage "https://github.com/phongndo/alive2-mcp"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.0/alive2-mcp_0.1.0_darwin_arm64.tar.gz"
      sha256 "d44b8f3868be8c923cb95c217de084c384217749c7387fc8f51e0974eecd93bc"
    end

    on_intel do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.0/alive2-mcp_0.1.0_darwin_amd64.tar.gz"
      sha256 "695d156801f534893c211d27d10f3a48200c45227bf9df3f78111c498ca80bdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.0/alive2-mcp_0.1.0_linux_arm64.tar.gz"
      sha256 "2e5147eac6322a78329737e86edd53091d77dcd2a1e110a9aa4f825aaa33125c"
    end

    on_intel do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.0/alive2-mcp_0.1.0_linux_amd64.tar.gz"
      sha256 "332858b2dae4e66ad6576d27f927e289a04f268c57df9adfdb78b4d2884dc71b"
    end
  end

  def install
    bin.install "alive2-mcp"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/alive2-mcp -version").strip
  end
end
