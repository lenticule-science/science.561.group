#!/usr/bin/env bash
# src/claude/install-claude-wiring.sh
#
# Master installer. Runs install-skills.sh and install-agents.sh.
# Run once after cloning, and re-run whenever skill or agent files change.
#
#   bash src/claude/install-claude-wiring.sh

set -e
REPO_ROOT="$(git rev-parse --show-toplevel)"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_ROOT"

bash "$SCRIPT_DIR/install-skills.sh"
echo
bash "$SCRIPT_DIR/install-agents.sh"
echo
bash "$SCRIPT_DIR/install-hooks.sh"
echo
bash "$SCRIPT_DIR/install-mcp.sh"
echo
echo "Wiring installed. Restart Claude Code to pick up changes."
