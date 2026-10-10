#!/usr/bin/env bash
# Build doc-gen4 API docs in WSL and drop them into sites/docs/api/.
#
# WHY WSL: doc-gen4's final `fromDb` step segfaults on Windows (0xC0000005) — a runtime
# bug in its SQLite-backed search/index assembly, NOT a toolchain gap. It builds fine on
# Linux. We use a SEPARATE WSL-side checkout (~/infomaterial-lean) so the Linux oleans never
# collide with the Windows .lake (mixing them forces constant full rebuilds on both sides).
#
# First run is slow (full Lean build in WSL). Subsequent runs are incremental.
# Called by `make api`.
set -e
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
case "$REPO_ROOT" in
  /[a-zA-Z]/*)
    drive="${REPO_ROOT:1:1}"
    rest="${REPO_ROOT:3}"
    WIN_LEAN="/mnt/${drive,,}/$rest"
    ;;
  /mnt/*)
    WIN_LEAN="$REPO_ROOT"
    ;;
  *)
    echo "[api] cannot translate repo path for WSL: $REPO_ROOT"
    exit 2
    ;;
esac
WSL_LEAN="\$HOME/infomaterial-lean"                  # the WSL-side checkout (literal \$HOME for WSL)
SITE_API="$(cd "$(dirname "$0")/.." && pwd)/sites/docs/api"

echo "[api] syncing source into WSL checkout (excluding build dirs)..."
wsl.exe bash -lc "
  set -e
  mkdir -p $WSL_LEAN
  if ! command -v rsync >/dev/null; then echo '[api] rsync missing in WSL — install with: sudo apt-get install -y rsync'; exit 2; fi
  # NB: lean/.git is a FILE (submodule gitdir pointer), so exclude '.git' (no slash) to
  # drop both the file and any dir form — otherwise the broken pointer poisons the checkout.
  rsync -a --delete \
    --exclude='.lake/' --exclude='_rendered/' --exclude='sites/docs/' \
    --exclude='docs/blueprint/web/' --exclude='.git' --exclude='docs/verso/' \
    '$WIN_LEAN/' \"$WSL_LEAN/\"
  # doc-gen4 builds source-location links from 'git remote get-url origin' + HEAD, so give
  # the checkout a fresh minimal repo with the real remote so :srcUri.github succeeds.
  # (The local SHA won't match upstream — fine for local docs.)
  cd \"$WSL_LEAN\"
  rm -rf .git
  git init -q
  git remote add origin https://github.com/emsenn/relational-math.git
  git add -A
  git -c user.email=ci@local -c user.name=ci commit -q -m 'doc-gen4 source ref' || true
  echo '[api] building Infomaterial:docs in WSL (doc-gen4)...'
  cd \"$WSL_LEAN\"
  ~/.elan/bin/lake build Infomaterial:docs
"

echo "[api] copying doc-gen4 HTML -> sites/docs/api/ ..."
rm -rf "$SITE_API"; mkdir -p "$SITE_API"
# WSL writes straight to the /mnt/c path — no path translation needed.
wsl.exe bash -lc "cp -r $WSL_LEAN/.lake/build/doc/. '$WIN_LEAN/sites/docs/api/'"

# doc-gen4 on Linux writes index.html via fromDb; if for any reason it's absent, redirect.
if [ ! -f "$SITE_API/index.html" ] && [ -f "$SITE_API/Infomaterial.html" ]; then
  printf '<!DOCTYPE html><meta charset="utf-8"><meta http-equiv="refresh" content="0; url=Infomaterial.html"><a href="Infomaterial.html">Infomaterial API &rarr;</a>\n' > "$SITE_API/index.html"
fi

[ -f "$SITE_API/index.html" ] && echo "[api] done -> sites/docs/api/index.html" || { echo "[api] FAILED — no HTML copied"; exit 1; }
