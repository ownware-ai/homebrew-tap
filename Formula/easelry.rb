# Homebrew formula for the Easelry binary. Lives in the tap repository (ownware-ai/homebrew-tap) as Formula/easelry.rb;
# scripts/release.ts fills in the version and the checksums from a GitHub release. The name follows the product's.
class Easelry < Formula
  desc "Your agents work on your real files; you see every change and can undo any of it"
  homepage "https://github.com/ownware-ai/easelry-plugin"
  version "0.1.1"
  license "proprietary"

  on_macos do
    on_arm do
      url "https://github.com/ownware-ai/homebrew-tap/releases/download/v#{version}/easelry-darwin-arm64.tar.gz"
      sha256 "9880e576df13a1b87c57845d6103b0fe68bf441037bd4f15b0a42558a18e79d8"
    end
    on_intel do
      url "https://github.com/ownware-ai/homebrew-tap/releases/download/v#{version}/easelry-darwin-x64.tar.gz"
      sha256 "5a6ee8123a27e42bb68ccdf4bac82f5967bfff1f1ce7188ab3d173c0ec6dd320"
    end
  end

  def install
    bin.install "easelry"
  end

  def caveats
    <<~EOS
      Start it with:  easelry
      It opens in your browser at http://127.0.0.1:4747 and keeps its data in
      ~/Library/Application Support/Easelry. Nothing leaves this Mac.
      Connect Claude Code, Codex or Claude Desktop from the Agents view, one click.
      Easelry is free while it is new; some features will be paid later.
    EOS
  end

  test do
    assert_match "easelry", shell_output("#{bin}/easelry --version")
  end
end
