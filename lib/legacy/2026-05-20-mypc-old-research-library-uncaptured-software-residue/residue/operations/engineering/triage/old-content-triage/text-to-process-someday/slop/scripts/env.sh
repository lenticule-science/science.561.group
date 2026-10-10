#!/usr/bin/env bash
# env.sh — Source this to set up PATH for proof assistants.
#
# Usage:
#   source scripts/env.sh
#
# Or add to your shell profile (.bashrc, .zshrc):
#   source /path/to/content/scripts/env.sh

# Lean (elan)
if [ -d "$HOME/.elan/bin" ]; then
  export PATH="$HOME/.elan/bin:$PATH"
fi

# Agda: prefer apt-installed /usr/bin/agda
# Set locale for Agda's Unicode output
export LC_ALL=C.UTF-8
