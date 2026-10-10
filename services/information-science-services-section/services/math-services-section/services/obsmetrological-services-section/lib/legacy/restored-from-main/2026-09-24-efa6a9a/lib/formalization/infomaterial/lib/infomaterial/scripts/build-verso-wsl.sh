#!/usr/bin/env bash
# Build and optionally render the Verso manual in WSL.
#
# Verso is a WSL/CI target here. Windows-native Lake can contaminate
# docs/verso/.lake with PE objects, while WSL builds expect ELF objects. Building
# directly on /mnt/c is also painfully slow for Verso's dependency tree.
#
# This script mirrors the Lean sources needed by docs/verso into a WSL ext4 cache,
# preserves that cache's .lake between runs, builds there, and copies rendered
# HTML back to docs/verso/_rendered. The correctness gate is building the
# InfomaterialManual library: that elaborates the manual's checked prose, names,
# docstrings, and Lean blocks.
set -e

TARGET="${1:-InfomaterialManual}"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

case "$REPO_ROOT" in
  /[a-zA-Z]/*)
    drive="${REPO_ROOT:1:1}"
    rest="${REPO_ROOT:3}"
    WIN_REPO="/mnt/${drive,,}/$rest"
    ;;
  /mnt/*)
    WIN_REPO="$REPO_ROOT"
    ;;
  *)
    echo "[verso] cannot translate repo path for WSL: $REPO_ROOT"
    exit 2
    ;;
esac

WIN_VERSO="$WIN_REPO/docs/verso"

if ! command -v wsl.exe >/dev/null 2>&1; then
  echo "[verso] wsl.exe not found; docs/verso builds on WSL/CI only."
  exit 2
fi

CAP_THREADS=1
CAP_CORES=0

echo "[verso] building '$TARGET' in WSL cache (gate: every weld elaborated; ${CAP_THREADS}-way)..."
wsl.exe bash -s -- "$WIN_REPO" "$TARGET" "$CAP_THREADS" "$CAP_CORES" <<'WSL_BUILD'
set -e

SRC="$1"
TARGET="$2"
CAP_THREADS="$3"
CAP_CORES="$4"
STAGE_ROOT="${INFOMATERIAL_VERSO_STAGE:-$HOME/.cache/infomaterial-verso-stage}"
STAGE="$STAGE_ROOT/lean"

mkdir -p "$STAGE" "$STAGE/docs" "$STAGE/docs/verso"

sync_dir() {
  local from="$1"
  local to="$2"
  mkdir -p "$to"
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --delete --exclude .lake --exclude _rendered "$from/" "$to/"
  else
    find "$to" -mindepth 1 -maxdepth 1 ! -name .lake ! -name _rendered -exec rm -rf {} +
    cp -a "$from/." "$to/"
    rm -rf "$to/.lake" "$to/_rendered"
  fi
}

sync_dir "$SRC/Infomaterial" "$STAGE/Infomaterial"
sync_dir "$SRC/docs/verso" "$STAGE/docs/verso"
cp "$SRC/Infomaterial.lean" "$SRC/lakefile.toml" "$SRC/lake-manifest.json" "$SRC/lean-toolchain" "$STAGE/"

cd "$STAGE/docs/verso"
LEAN_NUM_THREADS="$CAP_THREADS" taskset -c "$CAP_CORES" ~/.elan/bin/lake build "$TARGET"
WSL_BUILD

if [ "$TARGET" = "InfomaterialManual" ]; then
  echo "[verso] build green; rendering HTML (best-effort)..."
  wsl.exe bash -s -- "$WIN_VERSO" "$CAP_THREADS" "$CAP_CORES" <<'WSL_RENDER'
set -e

WIN_VERSO="$1"
CAP_THREADS="$2"
CAP_CORES="$3"
STAGE_ROOT="${INFOMATERIAL_VERSO_STAGE:-$HOME/.cache/infomaterial-verso-stage}"
STAGE="$STAGE_ROOT/lean"

cd "$STAGE/docs/verso"
rm -rf _rendered
LEAN_NUM_THREADS="$CAP_THREADS" taskset -c "$CAP_CORES" ~/.elan/bin/lake exe infomaterial-docs --output _rendered ||
  echo '[verso] render skipped (non-fatal; build is the gate)'
rm -rf "$WIN_VERSO/_rendered"
cp -a "$STAGE/docs/verso/_rendered" "$WIN_VERSO/_rendered" 2>/dev/null || true
WSL_RENDER
fi

echo "[verso] done."
