class Gptee < Formula
  version = "0.3.7"
  desc "Output from a language model using standard input as the prompt"
  homepage "https://github.com/zurawiki/gptee"
  url "https://github.com/zurawiki/gptee/archive/v" + version.to_s + ".tar.gz"
  sha256 "9092a9e36876d4f87c9259f0c68b5745c5b435d4189eac1e13e565028aea1445"
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
