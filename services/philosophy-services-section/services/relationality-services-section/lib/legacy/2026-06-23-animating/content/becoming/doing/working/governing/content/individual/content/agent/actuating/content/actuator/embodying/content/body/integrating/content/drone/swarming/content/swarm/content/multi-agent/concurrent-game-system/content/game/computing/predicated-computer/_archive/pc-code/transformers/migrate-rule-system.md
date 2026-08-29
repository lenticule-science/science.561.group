---
type: morphism
class: schema-operation
realizes: [schema-evolution]
depends-on: [closure-rule-system, schema-evolution, witness, conformance]
see-also: [migrate-shape, schema-evolution]
---

# Migrate rule system

The substrate operation that transitions from one [closure-rule-system](../objects/closure-rule-system.md) version to a successor version, optionally applying a migration recipe to pre-existing substrate content that requires update under the new rules. Migrate-rule-system is the substrate's primary schema-evolution operator at the rule-system layer.

## Signature

`migrate-rule-system(from-version, to-version, migration-recipe?, scope) → (migrated-substrate, migration-witness)`

Inputs:

- **`from-version`** — reference to the current rule-system version.
- **`to-version`** — reference to the new rule-system version. Must have `predecessor` linking back to `from-version` (possibly through intermediate versions).
- **`migration-recipe`** — optional reference to a recipe for transforming pre-existing content. Required for breaking changes; absent for forward-compatible additions.
- **`scope`** — references to the [scope](teaching/explanations/scope.md) the migration applies to.

Outputs:

- **`migrated-substrate`** — the substrate with `to-version` as active rule-system; pre-existing content optionally transformed.
- **`migration-witness`** — records the migration: from-version, to-version, recipe (if any), per-cell migration outcomes.

## Operational semantics

Migrate-rule-system proceeds in five steps:

1. *Validate version chain.* Verify `to-version` is reachable from `from-version` via the `predecessor` chain. Reject if not.
2. *Conformance check.* Per [run-conformance-test](run-conformance-test.md), verify the substrate's existing content is conformant against `to-version`'s shape and constraint requirements. Per [conformance-implies-substrate-properties](../theorems/conformance-implies-substrate-properties.md), conformant content is admissible under the new rules.
3. *Apply migration recipe (if present).* For each pre-existing cell that requires transformation per the recipe, apply the transformation. The transformation may involve [insertion](insertion.md) of new predications and (per the [retraction](retraction.md) discipline, repair-authorized) retraction of obsolete ones.
4. *Activate new version.* Update the substrate's active rule-system pointer to `to-version`. Subsequent operations use the new rule system.
5. *Witness emit.* Per [emit-witness](emit-witness.md), record the migration in the audit chain.

## Engineering invariants

- **Reversibility-preserving for additions.** Forward-compatible additions can be reversed by reverting to `from-version`. Per [stepping-laws](../theorems/stepping-laws.md), the restriction maps preserve the prior state.
- **Atomic per scope.** The migration is atomic within the scope: either all in-scope content is migrated (with the new rule-system active) or none. Partial migrations are rejected.
- **Witness-emitted.** Every migration produces a witness; per [settlement-determinism](../theorems/settlement-determinism.md), replay against the migration witness reproduces the migrated state.
- **Settling-boundary respect.** Per [settling-monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), migrations involving non-monotone changes form a new settling beyond the migration point.

## Failure modes

- **Version chain broken.** `to-version` does not link back to `from-version`. Reject; the substrate's predecessor chain must be intact.
- **Conformance failure.** Pre-existing content doesn't satisfy `to-version`'s requirements and no migration recipe was provided. Reject; the recipe must be supplied.
- **Recipe failure.** The migration recipe fails on some cell. Per the substrate's policy, either the migration aborts or the failing cells are flagged for manual repair.

## Position in the substrate

Migrate-rule-system is the substrate's *schema-evolution primitive at the rule layer*. Without it, schema evolution is ad-hoc; with it, every schema change is a substrate event with a known recipe and audit trail. Per [conformance-implies-substrate-properties](../theorems/conformance-implies-substrate-properties.md), the migration's success is verifiable by conformance-testing the post-migration substrate.
