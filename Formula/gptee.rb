class Gptee < Formula
  version = "0.3.8"
  desc "Output from a language model using standard input as the prompt"
  homepage "https://github.com/zurawiki/gptee"
  url "https://github.com/zurawiki/gptee/archive/v" + version.to_s + ".tar.gz"
  sha256 "969310c246e8d44d964bd18da3afa8bf1cd7032cde43479f2d2a10bc93e4518b"
  license "MIT"
  head "https://github.com/zurawiki/gptee.git", branch: "main"

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gptee -V")
  end
end
