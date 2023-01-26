class Gptcommit < Formula
  desc "Git prepare-commit-msg githook for authoring commit messages with GPT-3"
  homepage "https://github.com/zurawiki/gptcommit"
  url "https://github.com/zurawiki/gptcommit/archive/v0.1.11.tar.gz"
  sha256 "9b0a0f45fbc2a95d40528bc66e32708d7f2a9fc0183c91902f55c77e36e902fb"
  license "MIT"
  head "https://github.com/zurawiki/gptcommit.git", branch: "main"

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/gptcommit -V")
  end
end
