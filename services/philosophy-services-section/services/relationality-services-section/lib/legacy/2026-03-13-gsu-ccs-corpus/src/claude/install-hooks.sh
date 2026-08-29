#!/usr/bin/env bash
# src/claude/install-hooks.sh
#
# Generates .claude/settings.json by reading hook source files and skill
# definitions. Re-run whenever a hook prompt or hook script changes.
# Called by install-claude-wiring.sh.

set -e
cd "$(git rev-parse --show-toplevel)"

echo "Installing hooks..."

python3 - <<'PYEOF'
import json
from pathlib import Path

repo = Path.cwd()

# --- UserPromptSubmit: interpret-prompt (type: prompt) ---
# Reads the derivation skill and embeds its inference rules as the hook prompt.
# Claude runs this before every response; output is injected into context.
interpret_rules = (repo / "skills" / "interpret-prompt.md").read_text()

prompt_submit_prompt = (
    "You are a pre-processor running before the main response.\n"
    "Parse the user's most recent message into PromptUnits.\n\n"
    + interpret_rules +
    "\n\nOutput format — one line per unit:\n"
    "  TYPE / DEPARTMENT / \"text\" [/ field: value ...]\n\n"
    "If the message is purely conversational (ok, lol, thanks, yes, no, "
    "acknowledged, etc.) with no actionable content, output exactly: SKIP\n\n"
    "Do not explain. Do not add prose. Output only the unit list or SKIP.\n"
    "This output is prepended to Claude's context as [PARSED UNITS]."
)

# --- PostToolUse: math build guard (type: command) ---
math_guard_cmd = "bash src/claude/hooks/math-write-guard.sh"

settings = {
    "hooks": {
        "UserPromptSubmit": [
            {
                "hooks": [
                    {
                        "type": "prompt",
                        "prompt": prompt_submit_prompt
                    }
                ]
            }
        ],
        "PostToolUse": [
            {
                "matcher": "Write|Edit",
                "hooks": [
                    {
                        "type": "command",
                        "command": math_guard_cmd
                    }
                ]
            }
        ]
    }
}

out = repo / ".claude" / "settings.json"
out.parent.mkdir(exist_ok=True)
out.write_text(json.dumps(settings, indent=2) + "\n")
print(f"  settings.json: {len(settings['hooks'])} hook events configured")
print(f"  UserPromptSubmit: type=prompt (interpret-prompt derivation)")
print(f"  PostToolUse Write|Edit: type=command (math build guard)")
PYEOF

echo "Hooks done."
