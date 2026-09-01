---
type: definition
class: substrate-entity
realizes: [repair]
depends-on: [repair, closure-rule-record, retraction, settling-monotonicity]
see-also: [witness, closure-rule-record]
---

# Repair catalog

A **repair catalog** is the substrate entity that enumerates the substrate's *declared* repairs — the named, deterministic, witnessed corrections an operator may perform when an invariant would otherwise be violated. Per [repair](teaching/explanations/repair.md), every repair an operator invokes must have a catalog entry; the catalog is the substrate's index of admissible repairs, and per the substrate's [retraction](../morphisms/retraction.md) discipline, the catalog is what authorizes the only admissible non-monotone operations on substrate state (without violating [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) globally).

## Structural fields

A repair-catalog record carries the following predications:

- **`id`** — the catalog's substrate identifier.
- **`version`** — the canonical hash of the catalog at its current state.
- **`entries`** — an ordered list of repair records.

Each repair record in the catalog carries:

- **`code`** — a stable identifier for the repair. The code is what witnesses cite when recording that this repair was performed.
- **`description`** — one-line summary of the invariant the repair restores.
- **`severity`** — `repairable` (the operator may perform the repair and continue) or `hard` (the violation aborts the operator).
- **`recipe`** — references to the substrate operations that perform the repair. The recipe is itself substrate content: a sequence of [insertions](../morphisms/insertion.md), [retractions](../morphisms/retraction.md), and supporting traversals that, applied in order, restore the violated invariant.
- **`triggering-condition`** — a predicate pattern declaring when the repair is applicable. The substrate's closure rules consult the triggering condition before invoking the recipe.
- **`witness-format`** — a reference to the witness shape produced when the repair fires. Required for audit.

## Invariants

A repair catalog MUST satisfy:

- **Code uniqueness.** No two repair entries share a code.
- **Recipe-substrate-content.** Every operation in a recipe references substrate entities.
- **Witness coverage.** The cited witness format admits the predications the recipe produces; mismatch is a coherence violation.
- **Triggering-condition declarable.** The triggering condition is itself an entity.
- **Hash monotonicity.** Every repair invocation MUST produce a non-trivial state change: the substrate hash before the repair MUST differ from the substrate hash after. Failures surface as repair-recipe bugs.
- **Retraction-discipline-respecting.** Recipes that include retraction must satisfy the [retraction](../morphisms/retraction.md) discipline: the retraction is admissible only because it's authorized by a catalog entry. The substrate's settling-monotonicity holds *within* each settling; repair-driven retractions form a new settling beyond the repair point.

## Operations

- *Add an entry.* Inserting a new repair record into the catalog produces a new catalog version. The substrate's audit can replay any operation against the new catalog version; old witnesses remain valid against their corresponding old catalog version.
- *Retire an entry.* A repair entry is retired by setting `retired: true`; retired entries do not fire on new operations but their predications remain for audit.
- *Cite from a closure rule.* A [closure-rule record](closure-rule-record.md)'s `repairs-cited` predication references catalog entries by code. The substrate's validation checks that every cited code exists in the catalog.

## Position in the substrate

The repair catalog is the substrate's *named-correction index*. Without it, repairs are ad-hoc fixups invented by the implementation; with it, every fixup that occurs is a catalog entry, every entry is queryable, every invocation is witnessed against the catalog. The discipline is what makes operator behavior comparable across implementations: two substrates with the same catalog perform the same repairs in the same situations, with the same witnesses.

Catalog entries are versioned like closure rules: a substrate's repair behavior at any moment is determined by its current catalog version, and per [settlement-determinism](../theorems/settlement-determinism.md), audit at a past time consults the catalog version that was active at that time.
