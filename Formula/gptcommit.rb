class Gptcommit < Formula
  version = "0.5.6"
  desc "Git prepare-commit-msg hook for authoring commit messages with GPT-3"
  homepage "https://github.com/zurawiki/gptcommit"
  url "https://github.com/zurawiki/gptcommit/archive/v" + version.to_s + ".tar.gz"
  sha256 "e672af37539a3f1ab27da1d1154790c2148b7e1a7b1d263343f223361cb09874"
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
