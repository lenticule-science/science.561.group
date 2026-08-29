# Computer MUD system engineering services section

This section owns the theory of multi-user dungeons as programmable computer
systems: the science-side counterpart to
`engineering-services-section/.../computer-mud-engineering-services-section`,
which owns the code (the FeltOS kernel and preserved engine/mudlib lineage).

Where the engineering section asks how to build a MUD, this section asks what
a MUD *is*, as a computer-systems phenomenon: world-building as programming,
messaging and command architectures, session and world-state models, and the
research record for related engine projects.

## Layout

- `content/glossary/topics/` — definitional topics: `world-building-as-programming.md`
  (the core thesis that in a MUD, building a world and writing a program are
  the same act), `mud.md`, `lpmud.md`, `mud-libraries.md`, plus two
  alternate-source variants (`mud-library.md`, `multi-user-dungeon.md`)
  carried in as-is rather than merged.
- `content/documents/notes/` — standalone research notes: Discworld MUD's
  messaging architecture, and an analysis of the (unrelated, same-acronym)
  on-chain "MUD" framework's ECS architecture against EAVT-based knowledge
  systems.
- `content/documents/mud-server/` — a MUD server treated as a concept-computer
  design exercise, split into `operator/` (actions: persisting the world,
  executing a command) and `structure/` (components: command, session, server
  program, world state, transcript).
- `content/documents/qtmud/` — research notes on the qtmud project (`qtmud.md`,
  `qtmud.org`, and an alternate-source overview, `qtmud-relationality.md`).

Several of the above (2026-08-26) absorbed fuller drafts of the same notes
found during a triage sort of the engineering mirror's `content/text/triage/`,
superseding the shorter stubs first moved here. Duplicate-source variants
that were not identical were kept side by side rather than merged by hand;
merging them is a future pass.

## Scope boundary

This section is theory and design notes only. Executable code, mudlibs, and
preserved engine generations belong in the engineering mirror. A world's own
lore, rooms, and live content belong with that world's public domain section
(e.g. Teraum's paracosm), not here.
