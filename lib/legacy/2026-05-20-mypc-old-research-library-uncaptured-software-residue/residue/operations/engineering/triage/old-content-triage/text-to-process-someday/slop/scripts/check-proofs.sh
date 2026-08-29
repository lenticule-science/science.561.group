#!/usr/bin/env bash
# check-proofs.sh — Verify that the semiotic universe formalizations compile.
#
# Usage:
#   ./scripts/check-proofs.sh          # check both Lean and Agda
#   ./scripts/check-proofs.sh lean     # check Lean only
#   ./scripts/check-proofs.sh agda     # check Agda only

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
source "$SCRIPT_DIR/env.sh"

LEAN_DIR="$REPO_ROOT/mathematics/objects/universes/semiotic-universe/formalization/lean"
AGDA_DIR="$REPO_ROOT/mathematics/objects/universes/semiotic-universe/formalization/agda"

TARGET="${1:-all}"
EXIT_CODE=0

check_lean() {
  echo "=== Lean: lake build ==="
  if ! command -v lake &>/dev/null; then
    echo "SKIP: lake not found. Run scripts/setup-env.sh first."
    return 1
  fi
  (cd "$LEAN_DIR" && lake build 2>&1) || { echo "FAIL: Lean build failed."; return 1; }
  echo "PASS: Lean build succeeded."
}

check_agda() {
  echo "=== Agda: type-checking ==="
  if ! command -v agda &>/dev/null; then
    echo "SKIP: agda not found. Run scripts/setup-env.sh first."
    return 1
  fi
  agda "$AGDA_DIR/SemioticUniverse/Everything.agda" 2>&1 || {
    echo "FAIL: Agda type-check failed."
    return 1
  }
  echo "PASS: Agda type-check succeeded."
}

case "$TARGET" in
  lean)  check_lean  || EXIT_CODE=1 ;;
  agda)  check_agda  || EXIT_CODE=1 ;;
  all)
    check_lean  || EXIT_CODE=1
    echo ""
    check_agda  || EXIT_CODE=1
    ;;
  *)
    echo "Usage: $0 [lean|agda|all]"
    exit 1
    ;;
esac

exit $EXIT_CODE
