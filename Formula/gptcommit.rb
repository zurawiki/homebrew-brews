class Gptcommit < Formula
  version = "0.5.11"
  desc "Git prepare-commit-msg hook for authoring commit messages with GPT-3"
  homepage "https://github.com/zurawiki/gptcommit"
  url "https://github.com/zurawiki/gptcommit/archive/v" + version.to_s + ".tar.gz"
  sha256 "6f1d7080bcd1f0566ba2c88c266e874cdb08f489875825b746498d6004d5f9f3"
  license "MIT"
  head "https://github.com/zurawiki/gptcommit.git", branch: "main"

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gptcommit -V")
  end
end
