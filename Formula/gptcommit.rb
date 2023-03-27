class Gptcommit < Formula
  version = "v0.5.1"
  desc "Git prepare-commit-msg hook for authoring commit messages with GPT-3"
  homepage "https://github.com/zurawiki/gptcommit"
  url "https://github.com/zurawiki/gptcommit/archive/v" + version.to_s + ".tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
