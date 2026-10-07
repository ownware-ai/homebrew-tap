# Homebrew formula for the Easelry binary. Lives in the tap repository (ownware-ai/homebrew-tap) as Formula/easelry.rb;
# scripts/release.ts fills in the version and the checksums from a GitHub release. The name follows the product's.
class Easelry < Formula
  desc "Your agents work on your real files; you see every change and can undo any of it"
  homepage "https://github.com/ownware-ai/easelry-plugin"
  version "0.1.0"
  license "proprietary"

  on_macos do
    on_arm do
      url "https://github.com/ownware-ai/homebrew-tap/releases/download/v#{version}/easelry-darwin-arm64.tar.gz"
      sha256 "af47745c0a45e1391adab142d1193ce837a1b465d65a6029edd13605aa3e8213"
    end
    on_intel do
      url "https://github.com/ownware-ai/homebrew-tap/releases/download/v#{version}/easelry-darwin-x64.tar.gz"
      sha256 "27a2f42596475f206fd67d431c6b7413e8cebaba3df711e23af7328ea8c89670"
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
