#!/usr/bin/env bash
# setup-env.sh — Install and configure proof assistants for the
# semiotic universe formalization.
#
# Run this once per environment to ensure Lean and Agda are available.
# After running, source env.sh or add ~/.elan/bin to PATH.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
LEAN_DIR="$REPO_ROOT/mathematics/objects/universes/semiotic-universe/formalization/lean"
AGDA_DIR="$REPO_ROOT/mathematics/objects/universes/semiotic-universe/formalization/agda"

echo "=== Semiotic Universe: Environment Setup ==="

# --- Lean (via elan) ---
if command -v lean &>/dev/null || [ -x "$HOME/.elan/bin/lean" ]; then
  echo "[lean] Already installed: $(~/.elan/bin/lean --version 2>/dev/null || lean --version)"
else
  echo "[lean] Installing elan (Lean version manager)..."
  curl -sSf https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh | sh -s -- -y --default-toolchain none
  echo "[lean] elan installed."
fi

export PATH="$HOME/.elan/bin:$PATH"

# Ensure the toolchain specified in lean-toolchain is installed
if [ -f "$LEAN_DIR/lean-toolchain" ]; then
  TOOLCHAIN=$(cat "$LEAN_DIR/lean-toolchain" | tr -d '[:space:]')
  echo "[lean] Ensuring toolchain: $TOOLCHAIN"
  elan default "$TOOLCHAIN" 2>/dev/null || true
fi

# Fetch Mathlib dependencies
if [ -d "$LEAN_DIR" ]; then
  echo "[lean] Fetching lake dependencies..."
  (cd "$LEAN_DIR" && lake update 2>/dev/null || true)
fi

# --- Agda (via apt) ---
if command -v agda &>/dev/null; then
  echo "[agda] Already installed: $(agda --version)"
else
  echo "[agda] Agda not found. Installing via apt..."
  sudo apt-get update -qq
  sudo apt-get install -y agda agda-stdlib
  echo "[agda] Agda installed."
fi

# --- Agda standard library ---
if command -v agda &>/dev/null; then
  AGDA_STDLIB="$HOME/.agda/agda-stdlib"
  if [ ! -d "$AGDA_STDLIB" ]; then
    echo "[agda] Installing standard library..."
    mkdir -p "$HOME/.agda"
    git clone --depth 1 https://github.com/agda/agda-stdlib.git "$AGDA_STDLIB" 2>/dev/null || true

    # Write defaults file
    echo "$AGDA_STDLIB/standard-library.agda-lib" > "$HOME/.agda/libraries"
    echo "standard-library" > "$HOME/.agda/defaults"
    echo "[agda] Standard library configured."
  else
    echo "[agda] Standard library already present."
  fi
fi

echo ""
echo "=== Setup complete ==="
echo "Source scripts/env.sh or add to your shell profile:"
echo "  source $SCRIPT_DIR/env.sh"
