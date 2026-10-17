---
name: suggesting-skill-use
description: Reads each installed skill's _index.md suggests-for rules on PreToolUse and emits additionalContext when a tool input matches. Use when the polity wants skills to self-announce based on tool name and file path.
---

## Requirements

- Each skill that wants to self-announce has an `_index.md` in its directory whose frontmatter contains a `suggests-for:` list.
- Skills are installed into `.claude/skills/` (so the dispatcher can scan them at hook fire time).

## Steps

1. A skill author adds `_index.md` to the skill's directory with frontmatter of the form:
   ```yaml
   ---
   suggests-for:
     - tool: Write|Edit
       path: prose/learning/surveys/**
       say: Use surveying-concept when starting a new survey.
   ---
   ```
`tool` is a regex against the tool name (optional, defaults to any).
`path` is a glob against the tool input's `file_path` relative to the theory root (optional, defaults to any).
`say` is the announcement text shown to Claude.
2.
`scripts/pre.mjs` fires on every `PreToolUse`, reads the tool name and file path from stdin, scans every installed skill's `_index.md::suggests-for`, and collects matching rules.
3.
When at least one rule matches, the script emits a JSON `hookSpecificOutput.additionalContext` summarizing the matched suggestions and exits 0.
When nothing matches, it exits 0 silently.

## Outcomes

- Skills self-announce: when the agent is about to act on a tool/path a skill is responsible for, that skill is named in Claude's context before the call runs.
- No suggesting metadata lives in `SKILL.md` (which stays conformant with Anthropic's specification for agentic skills, carrying just `name` and `description`).
- Adding or changing announcement rules is purely a matter of editing `_index.md` in the relevant skill and reinstalling.
