---
type: concept
class: discipline
depends-on: [vocabulary-completeness, self-representation, closure-rule-system, settling-monotonicity, predication-fibration, base-admissibility-of-regimes, parameter-base-category]
see-also: [closure-rule, source-of-truth, migrate-rule-system, forward-migration-preserves-prior-content, schema-evolution-via-base-admissibility]
---

# Schema evolution

The substrate's discipline for *changing its vocabulary, shapes, and operator specifications* during the substrate's lifetime — adding a new predicate, retiring a deprecated one, revising a shape, replacing a closure rule — without losing the substrate's accumulated content and without requiring the substrate to be torn down and rebuilt. In the substrate's hyperdoctrine setting, schema evolution is *the substrate-side instance of moving the substrate's parameter base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ along an admissible base-morphism in the fibration of bases*. Per [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md), the substrate's safe-evolution criterion is exactly that the new base remains in the same regime as the old (per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md)) — schema changes that cross regime boundaries require regime-aware migration plans.

Schema evolution is the engineering content of "the substrate's program is editable while the substrate is running."

## Hyperdoctrinal grounding

The substrate's parameter base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ comprises:

- $\mathbf{L}$ — the value-domain residuated lattice
- $\mathcal{C}$ — the [parameter-base category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md) of admissible scopes / contexts
- $E$ — the entity set
- $\lambda$ — the settling-bound

A schema change moves $B$ along a particular base-morphism:

- **Adding a predicate.** Extending $\mathcal{C}$'s morphism set — adding a generator. The new $\mathcal{C}'$ contains $\mathcal{C}$; predications using the new predicate are admissible because the predicate is now in the fiber.
- **Retiring a predicate.** Marking a $\mathcal{C}$-morphism as deprecated. The substrate's admission discipline rejects new claims along the retired morphism; existing claims remain (per [event-log](../objects/event-log.md)'s append-only discipline).
- **Revising a shape.** Modifying a particular fiber $A_p$'s structure within the predication-fibration. Existing predications that no longer fit surface as substrate-level violations.
- **Replacing a closure rule.** Modifying the closure operator $\mathrm{cl}$ on the fiber-algebra. Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the new operator's iteration-to-fixed-point produces a different settled state.
- **Extending the entity set $E$.** Adding new entities; admissions on new entities become possible.
- **Increasing the settling-bound $\lambda$.** Allowing longer chains in transfinite-bounded or aperiodic regimes.

Per [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md), the change is *safe* (substrate continues to function with all existing content valid) iff the new base $B'$ is in the same regime as $B$ — per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), the regime is determined by base properties, and regime-preserving changes preserve the substrate's structural guarantees.

## The structural commitment

Per [self-representation](self-representation.md), the substrate's vocabulary, shapes, and operator specifications are themselves substrate entities — predications in the substrate's content. Editing them is editing predications. The substrate's [event log](../objects/event-log.md) records the edit; the substrate's working model reflects the edit on the next replay or on the next event admission cycle (depending on the runtime's strategy).

There are no separate schema-management subsystems, no out-of-band migration files, no version-tracked DDL. A schema change is a sequence of admitted messages:

- **Adding a predicate.** Admit a message asserting the new predicate's identity, its shape (per [shape](theories/agential-orchestration-platform/concepts/shape.md)), its admissibility within the relevant scope (per [scope](scope.md)). Subsequent admissions of predications using the new predicate are admissible because the predicate is now in scope.
- **Retiring a predicate.** Admit a message setting the predicate's `retired` predication to true. The substrate's admission discipline rejects new claims using the retired predicate; existing claims using the predicate remain (per [event-log](../objects/event-log.md)'s append-only discipline) but are flagged in queries and may be migrated by closure-rule application.
- **Revising a shape.** Admit a message updating the shape's predications. Existing predications that no longer fit the new shape surface as substrate-level violations (per [validate-against-shape](../morphisms/validate-against-shape.md)) until repaired.
- **Replacing a closure rule.** Admit a retirement message for the old rule, then an admission message for the new rule. Per [source-of-truth](source-of-truth.md), replaying the log under the new closure-rule set produces the working model that reflects the new rules.

## Replay under evolved schema

A substrate that has evolved its schema can be re-replayed from its event log under the *current* schema, producing a working model that reflects the latest specifications applied to all the historical content. This is what the substrate's [source-of-truth](source-of-truth.md) discipline makes possible: the log is schema-independent (it records what messages arrived); the working model is schema-applied (it reflects what the current closure rules and shapes produce when applied to the log).

Per [schema-evolution-via-base-admissibility](../theorems/schema-evolution-via-base-admissibility.md), the replay's correctness depends on the new base remaining in the same regime as the old: in the strict regime, replay is finite-time; in Scott-continuous, $\omega$-bounded; in transfinite-bounded, decomposable; in aperiodic, only via direct limits. A schema change that promotes the regime (e.g., from strict to Scott-continuous by introducing infinite vocabulary) requires the substrate's runtime to handle the new regime.

The discipline supports two engineering patterns:

- **Forward migration.** Add the new schema, replay, get the migrated state. The substrate's runtime computes the migration during replay; no separate migration script is needed. Per [forward-migration-preserves-prior-content](../theorems/forward-migration-preserves-prior-content.md), the prior content is preserved.
- **A/B comparison.** Replay the same log under two different schemas, compare the resulting working models. The comparison is itself a substrate operation; the substrate's [hash-discipline](hash-discipline.md) makes the comparison decisive.

## What the discipline rules out

- **Schema changes as runtime code.** A schema change that requires editing runtime code is a violation of [driver-substrate-split](driver-substrate-split.md). The right structure is to put the change in substrate content; the runtime reads the change automatically.
- **Schema-time runtime branching.** A reducer that has different behavior for "old schema" versus "new schema" has encoded schema awareness in runtime code. The right structure is closure rules whose premises distinguish the cases via predication match; per [read-discipline](read-discipline.md), the conditional belongs in substrate content.
- **Out-of-band schema authority.** A schema definition stored in a file the substrate doesn't know about is not substrate content. The substrate's discipline is to admit the schema definition through its admission primitive; per [reification](reification.md), the schema arrives as a sender-attributed reified message like any other.
- **Regime-promoting changes without regime-aware migration.** A schema change that moves the substrate from a finite regime to an infinite one without the substrate's runtime being prepared for the larger regime is a stability hazard — per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), the regime change is structural, not cosmetic.

## Migration patterns

The substrate's response to a schema change that affects existing content is determined by closure rules that map old content to new shape. Common patterns:

- **In-place rewrite.** A closure rule that matches old-schema predications and emits new-schema predications. The old predications may be retracted by a follow-up rule, or left in place as historical content depending on policy.
- **Lazy migration.** Old-schema predications remain valid but flagged; queries against the new schema use a closure rule to lift old-schema predications on demand.
- **Versioned coexistence.** Multiple schemas declared as separate sublocale-vocabularies; each application sublocale uses its own version. Per [closure-conditions-composability](../theorems/closure-conditions-composability.md), the sublocales' vocabularies compose cleanly under intersection.

## Position in the substrate

Schema evolution is the substrate's *program editability discipline*. It is what makes the substrate a substrate-and-program-in-one rather than a substrate-frozen-at-design. The discipline rests on three other disciplines being in place: [self-representation](self-representation.md) (the schema is substrate content), [source-of-truth](source-of-truth.md) (replay produces the schema-applied state from the schema-independent log), and [vocabulary-completeness](vocabulary-completeness.md) (the substrate surfaces vocabulary debt when content uses predicates not yet declared).

The pattern composes with [bootstrap](bootstrap.md) (the substrate's initial schema is admitted as bootstrap content; subsequent schema changes are ordinary admissions), with [federation](theories/agential-orchestration-platform/concepts/federation.md) (federated substrates may evolve their schemas independently, with bridges translating across versions), and with [branched-substrate-state](branched-substrate-state.md) (an evolving substrate may carry the old and new schemas in branches simultaneously, with the migration happening on a branch before being merged into the main scope).
