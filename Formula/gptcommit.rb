class Gptcommit < Formula
  version = "0.5.14"
  desc "Git prepare-commit-msg hook for authoring commit messages with GPT-3"
  homepage "https://github.com/zurawiki/gptcommit"
  url "https://github.com/zurawiki/gptcommit/archive/v" + version.to_s + ".tar.gz"
  sha256 "ba7804011396c8a2f0847f0689b6779309156f324d0044f119b9680ff318dca3"
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
