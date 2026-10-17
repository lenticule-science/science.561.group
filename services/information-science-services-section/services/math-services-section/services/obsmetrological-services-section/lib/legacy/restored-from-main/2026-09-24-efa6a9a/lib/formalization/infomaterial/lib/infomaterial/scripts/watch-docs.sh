#!/usr/bin/env bash
# Autosync: rebuild the affected doc surface when sources change, and reassemble the cockpit.
# Called by `make watch`. Polls (no inotify on Git Bash); debounced.
#
#   *.tex under docs/blueprint/src/  -> make blueprint        (fast)
#   *.lean under Infomaterial/       -> make build + check    (rebuild + honesty gate; regen lean_decls)
#
# Verso and the WSL API docs are NOT auto-rebuilt (too slow for a watch loop) — run
# `make verso` / `make api` by hand when you touch those. Run `make serve` in another
# terminal to view; the browser shows new output on refresh.
set -u
cd "$(dirname "$0")/.." || exit 1
STAMP=$(mktemp)
trap 'rm -f "$STAMP"' EXIT
touch "$STAMP"
echo "watching docs/blueprint/src/*.tex and Infomaterial/*.lean ... (Ctrl-C to stop)"
echo "tip: run 'make serve' in another terminal -> http://localhost:8000"

while true; do
  tex=$(find docs/blueprint/src -name '*.tex' -newer "$STAMP" 2>/dev/null | head -1)
  lean=$(find Infomaterial -name '*.lean' -newer "$STAMP" 2>/dev/null | head -1)
  if [ -n "$tex" ] || [ -n "$lean" ]; then
    sleep 1                      # debounce: let a burst of saves settle
    touch "$STAMP"
    echo ""; echo "[$(date +%H:%M:%S)] change detected"
    if [ -n "$lean" ]; then
      echo "  .lean -> make build + check"
      make build && make check || echo "  (build/check failed — see output above)"
    else
      echo "  .tex -> make blueprint"
      make blueprint || echo "  (blueprint failed — see output above)"
    fi
    bash scripts/assemble-cockpit.sh >/dev/null 2>&1
    echo "  cockpit reassembled — refresh the browser"
  fi
  sleep 2
done
