class Alive2Mcp < Formula
  desc "MCP server and CLI for checking LLVM IR transformations with Alive2"
  homepage "https://github.com/phongndo/alive2-mcp"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.1/alive2-mcp_0.1.1_darwin_arm64.tar.gz"
      sha256 "994bb424106acb1c30a0ff3a3ad3da9546b17c653c5fc9e413375305f5f41bbf"
    end

    on_intel do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.1/alive2-mcp_0.1.1_darwin_amd64.tar.gz"
      sha256 "231a079ad7a9c198a8813580d9eaca36314680d730daa7b8a8e934283d4b747a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.1/alive2-mcp_0.1.1_linux_arm64.tar.gz"
      sha256 "3283104834b8aaec00e768d19944034fe7e36fec5677f175fbcdc0b2d0bb8393"
    end

    on_intel do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.1/alive2-mcp_0.1.1_linux_amd64.tar.gz"
      sha256 "1621a4d60d6d4c1201b9a49ecd6df085b8844aa3b66322434c95731c0a6daaeb"
    end
  end

  def install
    bin.install "alive2-mcp"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/alive2-mcp -version").strip
  end
end
