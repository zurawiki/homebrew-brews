class Gptcommit < Formula
  version = "0.5.9"
  desc "Git prepare-commit-msg hook for authoring commit messages with GPT-3"
  homepage "https://github.com/zurawiki/gptcommit"
  url "https://github.com/zurawiki/gptcommit/archive/v" + version.to_s + ".tar.gz"
  sha256 "0d01c26662ed5d506925c05fcd3d5063dab6217f23b6b23ce9715e6ad37bea9c"
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
