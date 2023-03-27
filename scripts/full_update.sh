#!/usr/bin/env bash

set -euo pipefail

./scripts/update_formula.sh \
    gptcommit \
    "zurawiki/gptcommit" \
    "Git prepare-commit-msg hook for authoring commit messages with GPT-3"

./scripts/update_formula.sh \
    gptee \
    "zurawiki/gptee" \
    "Output from a language model using standard input as the prompt"
