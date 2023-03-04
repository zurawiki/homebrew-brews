class Gptee < Formula
  version = "0.3.0"
  desc "Output from a language model using standard input as the prompt"
  homepage "https://github.com/zurawiki/gptee"
  url "https://github.com/zurawiki/gptee/archive/v" + version.to_s + ".tar.gz"
  sha256 "94c1ed20c31eb24b85b94eacbfc8adfce96556e23f87e29182d47798a3cb3fcb"
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
