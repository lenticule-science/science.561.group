---
name: teaching-a-skill-to-a-character
description: Adds a skill slug to a character record's frontmatter skills list, idempotently and witnessed. Use when conferring a new capability on an existing character.
---

## Requirements

- A `character` name resolving to a record at `doing/governing/characters/<name>/<name>.md`.
- A `skill` slug resolving to a directory at `doing/working/hacking/doing/working/skills/<slug>/` containing `SKILL.md`.
- Optionally, a `defaults` JSON string. When supplied, the entry is written as a `{skill, defaults}` map; otherwise a bare slug entry is written.
- The character record's frontmatter parses as YAML and carries a `skills:` list.

## Steps

1. Run `node ${CLAUDE_SKILL_DIR}/scripts/teach-a-skill-to-a-character.mjs --character <name> --skill <slug> [--defaults '<json>']`.
2. The script resolves the skill directory; refuses with `skill-not-found` if absent.
3. The script resolves the character record; refuses with `bearer-not-found` if absent, `bearer-yaml-malformed` if YAML parse fails, `bearer-malformed` if the required `skills:` list is missing.
4. The script reads the character's `skills:` list. If the conferred slug is already present (in bare or map form), no write occurs; the witness records `alreadyPresent: true` (idempotency, per `teaching-a-skill.md` I4).
5. Otherwise the script appends the new entry to the `skills:` list, preserving existing entries' shape and the YAML indent of the list bullets, leaving all other frontmatter unchanged (I5).
6. The script re-parses the post-write YAML to confirm the entry landed and the character's identity cells survived (I6).
7. The script appends a witness line to `code/logs/tool-uses/<YYYY-MM-DD>.jsonl` naming the bearer record path, the conferred slug, and the `alreadyPresent` flag (I7).
8. The script emits a one-line JSON result to stdout: `{ok, bearer, conferred, alreadyPresent, written}`.

## Outcomes

- The character's record at `doing/governing/characters/<name>/<name>.md` has the conferred slug present in its `skills:` list. Other frontmatter is byte-unchanged.
- A witness line is appended to today's `code/logs/tool-uses/<date>.jsonl`.
- The MCP tool surface for the bearer character is stale until next SessionStart; if the bearer is the currently-bound character, follow up with `installing-a-character-as-a-claude-configuration` to refresh the harness.
- On refusal: nothing is written to the character record; a diagnostic is printed to stderr; exit non-zero. Refusal codes match `teaching-a-skill.md`'s refusal-conditions list.
