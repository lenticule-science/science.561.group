---
name: recording-a-progress-cell
description: Appends a bilattice-valued predication cell (s, p, o, v) to a task's Progress cells section. Use to record a concrete observation about a task's settling state.
---

## Requirements

- Path to a task `.md` file.
- Subject, predicate, and object for the cell (slugs or short strings).
- Value: one of `t` (true), `f` (false), `b` (bottom/unknown), or `top` (contradictory).
- Optionally, a human-readable note.

## Steps

1. Read the task file and locate or create the `## Progress cells` section in the body.
2. Append a new cell entry in the format `(s, p, o, v)` with the supplied values, plus the optional note on the same line.
3. Write the file back.

## Outcomes

- The `## Progress cells` section of the task file contains the new cell entry.
- On missing file: error reported, nothing written.
