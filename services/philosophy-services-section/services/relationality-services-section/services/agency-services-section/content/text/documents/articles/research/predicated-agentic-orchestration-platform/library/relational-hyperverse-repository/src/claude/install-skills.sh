#!/usr/bin/env bash
# src/claude/install-skills.sh
#
# Installs slash commands into .claude/commands/ from repo skill files.
# Run from repo root, or called by install-claude-wiring.sh.

set -e
cd "$(git rev-parse --show-toplevel)"

install_command() {
  local name="$1"
  local skill_path="$2"
  if [ ! -f "$skill_path" ]; then
    echo "  MISSING skill file: $skill_path (skipping /$name)"
    return
  fi
  printf 'Run skill: %s\n' "$skill_path" > ".claude/commands/${name}.md"
  echo "  /$name -> $skill_path"
}

mkdir -p .claude/commands
echo "Installing commands..."

install_command "do-work"        "skills/do-work.md"
install_command "triage"         "skills/triage.md"
install_command "familiarize"    "skills/familiarize.md"
install_command "improve-math"   "math/skills/improve-math.md"
install_command "improve-proofs" "proof/skills/improve-proofs.md"
install_command "improve-spec"   "spec/skills/improve-spec.md"
install_command "improve-src"    "src/skills/improve-src.md"

echo "Commands done."
