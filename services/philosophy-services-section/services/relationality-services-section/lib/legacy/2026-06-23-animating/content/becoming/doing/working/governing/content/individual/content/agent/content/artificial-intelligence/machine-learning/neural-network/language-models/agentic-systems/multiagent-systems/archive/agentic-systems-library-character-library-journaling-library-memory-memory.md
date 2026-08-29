---
name: memory
description: A character's curated, typed record persisted across sessions. Sub-structure of journaling. Four kinds per the Claude Code auto-memory convention. Inhabits the per-character path `<$character>/doing/working/journaling/library/memory/library/<kind>/<slug>.md`; mirrored at session-start into the Claude Code auto-memory directory.
specializing: journaling
---

A **memory** is one typed record a character keeps about itself across sessions. Memory cells are curated (an operator authors them deliberately) rather than time-stamped accretion (which is the diary's role). The kind partition comes from the Claude Code auto-memory convention:

- **feedback** — guidance the operator has given about how to approach work at this character.
- **reference** — pointers to external systems and resources.
- **user** — facts about the operator's role, preferences, and knowledge as they relate to this character.
- **project** — facts about ongoing work and goals at this character.

The cells live in two places, kept consistent by hooks:

- **In-repo (authoritative):** `<$character>/doing/working/journaling/library/memory/library/<kind>/<slug>.md`. Tracked in git.
- **Auto-memory (mirror):** `~/.claude/projects/<project-id>/memory/<kind>_<slug>.md`. What Claude Code's auto-memory system reads at session start. Populated from the in-repo location by [loading-the-memories](loading-the-memories/loading-the-memories.md) on SessionStart. Writes to the auto-memory location are intercepted by [routing-a-memory-write](../../../../../../operating-system/library/claude-code/library/auto-memory/library/memory-write/doing/working/routing-a-memory-write/routing-a-memory-write.md) and redirected.

## Characteristic predication-shape

- `has-kind(memory, {feedback | reference | user | project})` — required.
- `has-slug(memory, slug)` — required; kebab-case unique-within-kind identifier.
- `belongs-to(memory, character)` — the character whose memory this is. Per the polysemy theorem, every directory is a character, so memory is per-directory in practice.
- `authoritative-at(memory, in-repo-path)` — `<$character>/doing/working/journaling/library/memory/library/<kind>/<slug>.md`.
- `mirrored-to(memory, auto-memory-path)` — `~/.claude/projects/<project-id>/memory/<kind>_<slug>.md`.
