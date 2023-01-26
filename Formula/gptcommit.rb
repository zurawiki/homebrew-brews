class Gptcommit < Formula
  desc "A git prepare-commit-msg hook for authoring commit messages with GPT-3"
  homepage "https://github.com/zurawiki/gptcommit"
  url "https://github.com/zurawiki/gptcommit/archive/v0.1.10.tar.gz"
  sha256 "f3eae89fe66b1c6e6100bb01a82031c524da8fc40243e7f8914876994b932df7"
  head "https://github.com/zurawiki/gptcommit.git", branch: "main"
  license "MIT"

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
   system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/gptcommit -V")
  end
end
