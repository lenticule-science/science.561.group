#!/usr/bin/env bash
# src/claude/hooks/math-write-guard.sh
#
# PostToolUse hook (type: command).
# If a math unit file was just written or edited, run the build.
# Exits nonzero on build failure so Claude sees it immediately.

input=$(cat)
file_path=$(echo "$input" | python3 -c "
import sys, json
d = json.load(sys.stdin)
print(d.get('tool_input', {}).get('file_path', ''))
" 2>/dev/null)

# Unit files are lowercase kebab-case .md in math/ (not skills/, not context files)
basename=$(basename "$file_path" .md)
if [[ "$file_path" == */math/*.md ]] && [[ "$basename" =~ ^[a-z] ]] && [[ "$file_path" != */math/skills/* ]]; then
  cd "$(git -C "$(dirname "$file_path")" rev-parse --show-toplevel 2>/dev/null || git rev-parse --show-toplevel)"
  echo "[math-write-guard] running build after write to $file_path"
  python3 src/pipeline/build.py 2>&1
  exit $?
fi

exit 0
