#!/usr/bin/env bash
#
# Start the Predication Inference Engine over the 561 repo.
#
# Canonical entry point: runs the Model Context Protocol server,
# which wraps a predication-algebra-model backed by the filesystem
# at the 561 repo root (the engine's parent directory). The server
# will:
#
#   1. Walk the repo, honoring .gitignore + .farsignore + auto-skipping
#      foreign git repos under operations/.
#   2. Ingest every file the walker finds as substrate events.
#   3. Replay the event log into the working model (snapshot + delta).
#   4. Apply filetype enrichment via the format projectors.
#   5. Listen on stdin for MCP JSON-RPC messages.
#
# Usage:
#
#   ./engine/start.sh                              start with repo as root
#   ./engine/start.sh --exclude operations/foo     add an extra exclusion
#   ./engine/start.sh --root /other/dir            point at a different root
#   ./engine/start.sh < messages.jsonl             pipe MCP messages in
#
# The substrate persists at $REPO_ROOT/.fars-store/ — events in
# events/, content-addressed blobs in blobs/. Restarts delta-replay
# any events newer than the snapshot's cutoff.

set -euo pipefail

# Default substrate root is the parent of engine/ — that's the 561
# repo as a whole (library/, operations/, etc.). Callers can override
# with --root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# If --root is among the args, let the server see it directly and skip
# our default. Otherwise, pass --root $DEFAULT_ROOT plus any other args.
has_root_arg=false
for arg in "$@"; do
  case "$arg" in --root) has_root_arg=true; break;; esac
done

if [ "$has_root_arg" = true ]; then
  exec node "$SCRIPT_DIR/packages/predication-algebra-model-context-protocol-server/server.js" "$@"
else
  exec node "$SCRIPT_DIR/packages/predication-algebra-model-context-protocol-server/server.js" --root "$DEFAULT_ROOT" "$@"
fi
