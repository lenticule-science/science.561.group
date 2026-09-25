---
name: recognizing-a-character-as-leader-of-a-swarm
description: Writes a recognition cell asserting that a named character bears the leader role for a named swarm. Use when a worker accepts a character as the swarm's leader for the engagement.
title: recognizing-a-character-as-leader-of-a-swarm
---

## Requirements

- A `subject` slug naming the character being recognized as the leader. MUST resolve to `doing/governing/characters/<subject>/<subject>.md`.
- A `recognizer` slug naming the character doing the recognizing. MUST resolve likewise.
- Optional `recognition-note` string stating why the recognizer accepts this leader.

## Steps

1. Run `node ${CLAUDE_SKILL_DIR}/scripts/recognize-a-character-as-leader-of-a-swarm.mjs --subject <name> --recognizer <name> [--recognition-note "<text>"]`.
2. The script resolves both character records; refuses with `subject-not-found` or `recognizer-not-found` per the spec.
3. The script computes the recognition path: `doing/governing/recognitions/leader-of-a-swarm/<subject>/<recognizer>.md`.
4. The script checks idempotency: if the recognition file already exists, no write; returns `alreadyPresent: true` (R4).
5. Otherwise the script writes the recognition file with frontmatter `name`, `description`, `kind: recognition`, `subject`, `role: leader-of-a-swarm`, `recognizer`, `recognized-at`, optional `recognition-note`. The body is a brief one-line restating-of-the-cell (R5).
6. The script appends a witness line to `code/logs/tool-uses/<YYYY-MM-DD>.jsonl` (R7) and a one-line JSON result: `{ok, subject, recognizer, role, alreadyPresent, recognitionPath}`.

## Outcomes

- A new resource-file exists at `doing/governing/recognitions/leader-of-a-swarm/<subject>/<recognizer>.md`.
- The aggregate count of recognition files for the subject increased by one.
- A witness line is appended.
- On refusal: nothing written; diagnostic on stderr; exit non-zero. Refusal codes match `recognizing-a-character.md`.
