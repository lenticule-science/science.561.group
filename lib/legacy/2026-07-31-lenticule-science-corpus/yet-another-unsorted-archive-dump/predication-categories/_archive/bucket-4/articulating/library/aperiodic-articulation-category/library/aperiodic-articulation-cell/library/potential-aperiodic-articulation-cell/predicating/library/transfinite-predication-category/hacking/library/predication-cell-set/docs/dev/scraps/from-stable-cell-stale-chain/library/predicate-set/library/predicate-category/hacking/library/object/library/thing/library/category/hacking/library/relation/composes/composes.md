---
name: composes
description: The skill-composition morphism. Maps a skill to a sub-skill it invokes as a named step. Domain: skill. Codomain: skill.
---

Domain: `code/structures/skill.md` (the skill catalogue entry; pending — see [`skill`](../../work/governance/rules/specifications/skill.md) for the operative spec)
Codomain: same

A skill A `composes` skill B means: A's `## Steps` invoke B as a named step. The composition is *static* — recorded on A's `_index.md::composes` list — not conditional on which branch fired in a given session. A skill MAY list a sub-skill it calls only on some paths; `composes` records the call surface, not the call trace.

The `composes` DAG MUST be acyclic. A skill MUST NOT directly or transitively compose itself.

`composes` is distinct from:

- [`requires`](requires.md) — between specifications; pins that one spec's invariants depend on another's ground.
- [`depends-on`](depends-on.md) — between tasks; pins ordering between work items.
- [`decomposes-into`](decomposes-into.md) — between tasks; pins part-whole structure of work.

`composes` is between skills. It is the morphism whose graph, traversed, gives the executable-call DAG over the skill catalogue.
