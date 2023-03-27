class Gptee < Formula
  version = "0.3.5"
  desc "Output from a language model using standard input as the prompt"
  homepage "https://github.com/zurawiki/gptee"
  url "https://github.com/zurawiki/gptee/archive/v" + version.to_s + ".tar.gz"
  sha256 "328f62524cc1043ec5b6544d62c0f3b729e82ba135022ecf624fae92851dc41e"
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
