#!/usr/bin/env bash
# UserPromptSubmit hook: inject context self-monitoring instruction.
#
# Outputs JSON with additionalContext reminding the agent to track context
# usage and warn / trigger wind-down at thresholds.

cat <<'EOF'
{"hookSpecificOutput": {"hookEventName": "UserPromptSubmit", "additionalContext": "CONTEXT MONITOR: Estimate your cumulative context usage this session. When you judge you have consumed roughly 80% of your context window, warn the user: 'Context is around 80% full. Consider wrapping up soon.' When you judge you have consumed roughly 90%, say: 'Context is at ~90%. Running wind-down now.' and immediately execute the wind-down skill (skills/wind-down.md) without waiting for user approval. These thresholds are your responsibility to enforce."}}
EOF
