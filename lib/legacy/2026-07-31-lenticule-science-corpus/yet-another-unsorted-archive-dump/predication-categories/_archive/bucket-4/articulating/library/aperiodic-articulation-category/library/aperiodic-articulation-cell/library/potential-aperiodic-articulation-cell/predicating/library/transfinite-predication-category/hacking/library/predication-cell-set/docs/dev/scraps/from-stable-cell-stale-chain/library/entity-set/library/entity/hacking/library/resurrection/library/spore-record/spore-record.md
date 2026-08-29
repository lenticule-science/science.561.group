---
name: spore-record
description: A Padovan-ticked respawn anchor carrying a subset of a dead entity's morphisms and a set of anastomosis-permits naming the captains permitted to incorporate the spore.
category: paracosmic-emulator
fields: []
references:
  - id: padovan2002
    type: chapter
    title: Dom Hans van der Laan and the Plastic Number
    in: Nexus IV: Architecture and Mathematics
    publisher: Kim Williams Books
    location: Fucecchio
    author:
      - literal: Padovan, Richard
    page: 181-193
    issued:
      - year: 2002
---

A spore-record is what the cell graph carries after an entity dies under the paracosmic-emulator's death mechanic. The dead entity's full record-set settles and is unreachable; in its place, a spore-record is written carrying a partial replica with a defined relationship to the predecessor.

## What the spore carries

Three things, each a cell or cell-set on the spore-record:

- **A morphism subset.** The subset of the dead entity's morphisms that survive into the spore. Which morphisms survive is determined by the closure-rule firing at the moment of death — the morphisms that were potential in the entity's settled-but-partnered region pass into the spore; the ones that had already settled into vocabulary-atoms at the tower level above do not.
- **An anastomosis-permit set.** A list naming which captains' scopes are permitted to incorporate the spore via anastomosis. The permit is what allows the spore to be picked up by a different captain's fleet rather than respawning under the original captain's scope.
- **A Padovan-sequenced maturation count.** The number of ticks until the spore matures back into a full entity. The Padovan sequence (1, 1, 1, 2, 2, 3, 4, 5, 7, 9, 12, …) gives the maturation timing; the count starts at the spore's emission and decrements per `running-world-tick` until it reaches zero, at which point `respawning-from-spore` fires and produces a new entity from the spore.

## The respawn mechanic

When a spore's maturation count reaches zero (or sooner, if anastomosis fires), the morphism `respawning-from-spore` produces a new entity-record. The new entity:

- inherits the spore's morphism subset (typed signature partially preserved);
- starts at the spore's location (or the absorbing captain's location, under anastomosis);
- carries a `posthumous-influence-record` cell linking back to the predecessor.

The new entity is structurally a partial replica with explicit provenance. Not save-and-reload; the new entity has different cells than the predecessor wherever the morphism subset is strict, and the predecessor's settled-and-promoted morphisms now live at the tower level above as vocabulary atoms.

## Why Padovan

The Padovan sequence's slower growth rate (compared to Fibonacci) produces respawn timing that scales with the local game state without trivially overwhelming the world tick. The choice is a design call from the `voidskiff-world-and-mechanics-task`; the math behind it is the Padovan recurrence $P(n) = P(n-2) + P(n-3)$ with $P(0) = P(1) = P(2) = 1$ [@padovan2002].

## Cells the spore-record should bear (gaps surfaced)

The frontmatter currently carries only `name`, `description`, `category`, and an empty `fields:`. The cells the record SHOULD bear, with their needed transformer vocabulary:

- `(spore-record, predecessor-entity, <entity-record>)` — names the entity the spore was emitted from. Predicate `predecessor-entity` has no transformer at `code/transformers/`; needs to be earned.
- `(spore-record, carries-morphism-subset, <list>)` — names the morphisms preserved into the spore. Predicate `carries-morphism-subset` (or `surviving-morphisms`) is a gap.
- `(spore-record, anastomosis-permit, <captain-record>)` — one cell per permitted captain. Predicate `anastomosis-permit` is a gap.
- `(spore-record, maturation-tick-count, <integer>)` — the Padovan-sequenced count. Predicate `maturation-tick-count` is a gap.
- `(spore-record, matures-into, entity-record)` — the morphism `respawning-from-spore` produces an entity-record. Predicate `matures-into` is a gap (or could be derived from the transformer's codomain).

## Related internal records

- [voidskiff-world-and-mechanics-task](../../doing/working/hacking/doing/working/planning/library/task/library/voidskiff-world-and-mechanics/voidskiff-world-and-mechanics.md) — names spore-record in `adds.objects` and `respawning-from-spore` in `adds.morphisms`. Spec for the spore mechanic.
- [death-and-transformation-task](../../doing/working/hacking/doing/working/planning/library/task/library/death-and-transformation/death-and-transformation.md) — names `entity-death-event-record`, `posthumous-influence-record`, and the dying-of-entity / folding-entity-into-vocabulary-atom morphisms; the death side of the spore production.

## What's not yet proved

- That the Padovan timing produces stable game-tempo across world-tick scales. Empirical question once the engine runs.
- That the morphism-subset selection rule (which morphisms survive death) preserves the predecessor's identity in the categorical sense. Probably stateable as a functor from pre-death entity-category to post-death entity-category with the predecessor as the canonical morphism — but the proof needs the entity-category to be specified first.
- That `respawning-from-spore` is well-defined as a categorical morphism, not just a runtime operation. Depends on the entity-record category and the spore-record category being specified with their own categorical signatures.
