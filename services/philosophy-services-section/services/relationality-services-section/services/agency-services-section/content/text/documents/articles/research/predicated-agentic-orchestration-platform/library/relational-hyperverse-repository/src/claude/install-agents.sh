#!/usr/bin/env bash
# src/claude/install-agents.sh
#
# Installs agent definitions into .claude/agents/ from src/claude/agents/.
# Run from repo root, or called by install-claude-wiring.sh.
#
# Agent source files live at src/claude/agents/<name>.md.
# The install step copies them into .claude/agents/<name>.md where
# Claude Code discovers them.

set -e
cd "$(git rev-parse --show-toplevel)"

install_agent() {
  local name="$1"
  local source="src/claude/agents/${name}.md"
  if [ ! -f "$source" ]; then
    echo "  MISSING agent file: $source (skipping $name)"
    return
  fi
  cp "$source" ".claude/agents/${name}.md"
  echo "  agent: $name -> $source"
}

mkdir -p .claude/agents
echo "Installing agents..."

# install_agent "math-agent"
# install_agent "proof-agent"
# install_agent "spec-agent"
# install_agent "src-agent"

echo "Agents done. (none defined yet — add entries above as agent files are written)"
