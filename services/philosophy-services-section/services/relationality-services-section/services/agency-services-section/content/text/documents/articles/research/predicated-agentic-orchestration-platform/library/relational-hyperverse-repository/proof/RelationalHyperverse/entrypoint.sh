#!/usr/bin/env bash
set -euo pipefail

# ── SSH authorized keys ───────────────────────────────────────────────────────
if [[ -n "${SSH_AUTHORIZED_KEYS:-}" ]]; then
    echo "$SSH_AUTHORIZED_KEYS" > /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
else
    echo "[entrypoint] WARNING: SSH_AUTHORIZED_KEYS not set — SSH login will not work."
    echo "[entrypoint] Set it in .env and restart: docker compose down && docker compose up -d"
fi

# ── Lean .olean cache ─────────────────────────────────────────────────────────
# The image bakes the Mathlib cache at /lean-cache.
# If the bind-mounted repo doesn't yet have a .lake directory, symlink it
# so that the first lake build is fast.
LAKE_DIR="/repo/proof/RelationalHyperverse/.lake"
if [[ ! -e "$LAKE_DIR" ]]; then
    echo "[entrypoint] No .lake found — symlinking baked cache."
    ln -s /lean-cache "$LAKE_DIR"
fi

# ── SSH daemon ────────────────────────────────────────────────────────────────
mkdir -p /run/sshd
exec /usr/sbin/sshd -D &

echo "[entrypoint] Ready. Connect: ssh -p 2222 root@<host>"

exec sleep infinity
