#!/usr/bin/env bash
# src/claude/install-mcp.sh
#
# Adds the repo-engine MCP server to .mcp.json.
# Preserves existing entries (lean-lsp, github, etc.).
# Run from repo root, or called by install-claude-wiring.sh.

set -e
cd "$(git rev-parse --show-toplevel)"

echo "Installing MCP server..."

python3 - <<'PYEOF'
import json
from pathlib import Path

repo = Path.cwd()
mcp_file = repo / ".mcp.json"

config = json.loads(mcp_file.read_text()) if mcp_file.exists() else {"mcpServers": {}}

config["mcpServers"]["repo-engine"] = {
    "command": "python3",
    "args": ["src/engine/mcp_server.py"],
    "cwd": str(repo),
    "env": {
        "ANTHROPIC_API_KEY": "${ANTHROPIC_API_KEY}"
    }
}

mcp_file.write_text(json.dumps(config, indent=2) + "\n")
print(f"  repo-engine -> src/engine/mcp_server.py")
print(f"  total servers: {list(config['mcpServers'].keys())}")
PYEOF

echo "MCP done."
