class Alive2Mcp < Formula
  desc "MCP server and CLI for checking LLVM IR transformations with Alive2"
  homepage "https://github.com/phongndo/alive2-mcp"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.2/alive2-mcp_0.1.2_darwin_arm64.tar.gz"
      sha256 "302949a2d89d5ef90c78a85915ae888eba7bbbd72e2ec244695f4418954ef33a"
    end

    on_intel do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.2/alive2-mcp_0.1.2_darwin_amd64.tar.gz"
      sha256 "328bfa7ea45ba70319d0fd95b2e27ca41a90b83e588170808ca830b3fae7640e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.2/alive2-mcp_0.1.2_linux_arm64.tar.gz"
      sha256 "0174845547183a0057478cabeb43d9203740f6dfbf923aa6e5e2ed6df04fedb9"
    end

    on_intel do
      url "https://github.com/phongndo/alive2-mcp/releases/download/v0.1.2/alive2-mcp_0.1.2_linux_amd64.tar.gz"
      sha256 "5a5049b317b68a7c7fd0c06ca7e82410320bfc833f65f4bd9bfc39078d5c0d04"
    end
  end

  def install
    bin.install "alive2-mcp"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/alive2-mcp -version").strip
  end
end
