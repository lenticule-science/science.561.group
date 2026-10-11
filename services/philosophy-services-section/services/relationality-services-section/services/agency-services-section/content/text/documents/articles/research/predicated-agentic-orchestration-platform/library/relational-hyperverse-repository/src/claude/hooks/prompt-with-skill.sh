#!/usr/bin/env bash
# UserPromptSubmit hook: wrap user prompt with prescript + postscript from wrap-prompt.yaml.
#
# Reads the prompt from stdin (Claude Code passes event JSON).
# Loads runbooks/wrap-prompt.yaml to get prescript and postscript_skill.
# Emits: prescript + user message + postscript skill content.

set -e
cd "$(git rev-parse --show-toplevel)"

# Read the prompt from stdin JSON
PROMPT=$(python3 -c "
import json, sys
data = json.load(sys.stdin)
print(data.get('prompt', ''))
")

# Skip purely conversational messages and direct skill invocations
case "$PROMPT" in
  ok|okay|yes|no|lol|thanks|thank\ you|acknowledged|"")
    exit 0
    ;;
  /*)
    exit 0
    ;;
esac

# Load prescript and postscript_skill path from wrap-prompt.yaml
read -r PRESCRIPT POSTSCRIPT_SKILL < <(python3 -c "
import yaml, sys
with open('runbooks/wrap-prompt.yaml') as f:
    rb = yaml.safe_load(f)
prescript = rb.get('prescript', '').strip()
skill_path = rb.get('postscript_skill', '')
print(prescript)
print(skill_path)
" | { read -r line1; read -r line2; echo "$line1" "$line2"; })

# Re-read properly (multiline prescript needs careful handling)
PRESCRIPT=$(python3 -c "
import yaml
with open('runbooks/wrap-prompt.yaml') as f:
    rb = yaml.safe_load(f)
print(rb.get('prescript', '').strip())
")

POSTSCRIPT_SKILL=$(python3 -c "
import yaml
with open('runbooks/wrap-prompt.yaml') as f:
    rb = yaml.safe_load(f)
print(rb.get('postscript_skill', ''))
")

POSTSCRIPT=""
if [ -n "$POSTSCRIPT_SKILL" ] && [ -f "$POSTSCRIPT_SKILL" ]; then
    POSTSCRIPT=$(cat "$POSTSCRIPT_SKILL")
fi

cat <<EOF
$PRESCRIPT

<user_message>
$PROMPT
</user_message>

$POSTSCRIPT
EOF
