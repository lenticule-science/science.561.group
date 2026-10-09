---
name: composes
description: "The skill-composition morphism. Maps a skill to a sub-skill it invokes as a named step. Domain: skill. Codomain: skill."
title: composes
---

Domain: `code/structures/skill.md` (the skill catalogue entry; pending — see [`skill`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/work/governance/rules/specifications/skill.md) for the operative spec)
Codomain: same

A skill A `composes` skill B means: A's `## Steps` invoke B as a named step. The composition is *static* — recorded on A's `_index.md::composes` list — not conditional on which branch fired in a given session. A skill MAY list a sub-skill it calls only on some paths; `composes` records the call surface, not the call trace.

The `composes` DAG MUST be acyclic. A skill MUST NOT directly or transitively compose itself.

`composes` is distinct from:

- [`requires`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/relation/composes/requires.md) — between specifications; pins that one spec's invariants depend on another's ground.
- [`depends-on`](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/relation/composes/depends-on.md) — between tasks; pins ordering between work items.
- [`decomposes-into`](decomposes-into.md) — between tasks; pins part-whole structure of work.

`composes` is between skills. It is the morphism whose graph, traversed, gives the executable-call DAG over the skill catalogue.
