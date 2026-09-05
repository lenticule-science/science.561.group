---
name: withdrawing-recognition-of-a-character-as-leader-of-a-swarm
description: Removes a previously written recognition cell so the named character is no longer recognized by the withdrawing worker as the swarm's leader. Use when a worker no longer recognizes a leader and aggregate recognition needs to fall.
---

## Requirements

- A `subject` slug naming the character whose leader-recognition is being withdrawn.
- A `recognizer` slug naming the character pulling back the recognition. MUST be the same character that wrote the recognition (only the recognizer may withdraw their own cell).
- Optional `recognition-note` string explaining the withdrawal.

## Steps

1. Run `node ${CLAUDE_SKILL_DIR}/scripts/withdraw-recognition-of-a-character-as-leader-of-a-swarm.mjs --subject <name> --recognizer <name> [--recognition-note "<text>"]`.
2. The script resolves both character records; refuses with `subject-not-found` or `recognizer-not-found` per the spec.
3. The script computes the recognition path: `doing/governing/recognitions/leader-of-a-swarm/<subject>/<recognizer>.md`.
4. The script checks the recognition exists; refuses with `recognition-not-present` if absent (R6).
5. The script removes the recognition file.
6. The script appends a witness line to `code/logs/tool-uses/<YYYY-MM-DD>.jsonl` (R7) and a one-line JSON result: `{ok, subject, recognizer, role, removed: true}`.

## Outcomes

- The recognition file at `doing/governing/recognitions/leader-of-a-swarm/<subject>/<recognizer>.md` no longer exists.
- The aggregate count of recognitions for the subject decreased by one.
- If the aggregate falls below the standing threshold (today: one), the subject is no longer a recognized leader; downstream operations gated by leader-recognition will refuse with `marker-unauthorized` for this character.
- A witness line is appended.
- On refusal: nothing removed; diagnostic on stderr; exit non-zero.
