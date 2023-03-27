#!/usr/bin/env bash

set -euo pipefail

function usage() {
  echo "Usage: $0 <bin_name> <repo_url> <brew_desc>"
  echo "Example: $0 gptcommit \"zurawiki/gptcommit\" \"Git prepare-commit-msg hook for authoring commit messages with GPT-3\""
}

if [ "$#" -ne 3 ]; then
  usage
  exit 1
fi

export BIN_NAME="$1"
export REPO_NAME="$2"
export BREW_DESC="$3"

export REPO_URL="https://github.com/$REPO_NAME"
export BREW_VERSION="$(
    curl -sL "https://api.github.com/repos/$REPO_NAME/releases/latest" \
    | python3 -c 'import sys, json; print(json.load(sys.stdin)["tag_name"])'
)"
export BREW_HASH="$(curl -sL "$REPO_URL/archive/v$BREW_VERSION.tar.gz" | shasum -a 256 | cut -d ' ' -f 1)"
export BREW_CLASS="$(tr '[:lower:]' '[:upper:]' <<< ${BIN_NAME:0:1})${BIN_NAME:1}"
export BREW_FILE="Formula/$BIN_NAME.rb"


# Update formula
cat <<EOF  > "$BREW_FILE"
class $BREW_CLASS < Formula
  version = "$BREW_VERSION"
  desc "$BREW_DESC"
  homepage "$REPO_URL"
  url "$REPO_URL/archive/v" + version.to_s + ".tar.gz"
  sha256 "$BREW_HASH"
  license "MIT"
  head "$REPO_URL.git", branch: "main"

  depends_on "rust" => :build

  uses_from_macos "zlib"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/$BIN_NAME -V")
  end
end
EOF
