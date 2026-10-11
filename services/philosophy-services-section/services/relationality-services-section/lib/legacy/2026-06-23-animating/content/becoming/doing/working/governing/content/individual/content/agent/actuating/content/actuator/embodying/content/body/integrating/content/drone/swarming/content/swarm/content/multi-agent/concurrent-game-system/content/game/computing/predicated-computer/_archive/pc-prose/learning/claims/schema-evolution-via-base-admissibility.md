---
type: theorem
class: engineering-claim
status: proved
depends-on: [schema-evolution, base-admissibility-of-regimes, four-regime-dichotomy, parameter-base-category, predication-fibration, settlement-via-closure-2-monad, forward-migration-preserves-prior-content]
see-also: [conformance-via-fiber-algebra-functor, regime-classification-for-substrate]
---

# Safe schema evolution preserves the substrate's regime classification

**Claim.** For any substrate [schema evolution](teaching/explanations/schema-evolution.md) moving the parameter base from $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ to $B' = (\mathbf{L}', \mathcal{C}', E', \lambda')$, the change is *safe* (the substrate's existing predications remain valid and replay terminates within the substrate's runtime envelope) iff $B'$ is in the same [regime classification](../theorems/regime-classification-for-substrate.md) as $B$ — per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), the regime is determined by base-parameter properties (finiteness of $\mathbf{L}$, $E$, $\mathcal{C}$ and Scott-continuity of closure operators) and is invariant under regime-preserving base-morphisms.

## Why this holds

Per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), the four [regime strata](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/regime-decomposition.md) admit non-emptiness conditions:

- **Strict** ($\kappa < \omega$) — always non-empty.
- **Scott-continuous** ($\kappa = \omega$) — non-empty iff at least one of $\mathbf{L}$, $E$, $\mathcal{C}$ is infinite, and the predicate category admits finitary closure rules producing $\kappa = \omega$ settlings.
- **Transfinite-bounded** ($\omega < \kappa < \omega_1$) — non-empty iff $\mathcal{C}$ admits non-Scott-continuous closure operators with state-space cofinality bounded below $\omega_1$.
- **Aperiodic** ($\kappa \geq \omega_1$) — non-empty iff $\mathcal{C}$ admits non-Scott-continuous closure operators with state-space cofinality $\geq \omega_1$.

A schema change that moves $B \to B'$ along a base-morphism may or may not preserve the regime:

- **Regime-preserving change.** $B$ and $B'$ classify into the same regime. Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the substrate's closure-iteration converges in the same ordinal class on both bases; existing predications, which were valid at base $B$, remain valid at $B'$ (per [forward-migration-preserves-prior-content](forward-migration-preserves-prior-content.md)).
- **Regime-promoting change.** $B'$ is in a higher regime (e.g., strict $\to$ Scott-continuous, by introducing infinite vocabulary or infinite entity set). The substrate's closure-iteration may now require more steps; the runtime must be prepared for the larger regime. Existing predications remain valid, but new computations may not terminate within the strict-regime fuel bound.
- **Regime-demoting change.** $B'$ is in a lower regime (e.g., Scott-continuous $\to$ strict, by removing infinite vocabulary). Per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), this requires verifying that *every* settling that was valid at $B$ remains in the lower regime at $B'$. Predications using the removed vocabulary become invalid; the substrate must record a retraction.

Combining: a schema change is safe iff the regime is preserved (no required runtime promotion, no invalidation of existing content) — exactly the condition that $B$ and $B'$ are in the same stratum of the regime decomposition.

## Engineering consequence

- **Adding a finite predicate is always safe.** Adding finitely many morphisms to $\mathcal{C}$ doesn't change the substrate's regime: a finite-base substrate stays finite-base, an infinite-base substrate stays infinite-base. The change is structurally safe.
- **Promoting from finite to infinite vocabulary requires runtime preparedness.** A schema change introducing an infinite predicate-set (e.g., a generated-on-demand predicate family) moves the substrate from strict to at-least-Scott-continuous. The runtime must handle $\omega$-bounded settlings. Per [scott-continuity-as-checkpointability](scott-continuity-as-checkpointability.md), Scott-continuous regimes admit checkpointing — the substrate's fuel bound becomes per-checkpoint, not absolute.
- **Removing predicates from infinite vocabulary requires retraction.** A schema change retiring an infinite predicate-set requires the substrate to retract all predications using the removed predicates. Per [retraction](../morphisms/retraction.md), this is a repair-authorized retraction recorded in the witness chain.
- **Aperiodic-regime substrates can't be safely demoted.** Per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md), aperiodic-regime substrates have settlings with $\kappa \geq \omega_1$; demoting to a lower regime requires removing the aperiodic content, which may require the substrate to abandon entire content classes. The substrate's discipline is to avoid aperiodic-regime use unless explicitly required.
- **Migration plans correspond to regime-classification changes.** A migration plan that moves the substrate across regime boundaries must be regime-aware: per [regime-classification-for-substrate](regime-classification-for-substrate.md), the runtime needs to know which regime it's entering before initiating the migration.

## What the theorem rules out

- **Silent regime promotion.** A schema change that introduces infinite vocabulary without declaring the regime promotion is a stability hazard — the substrate's runtime may not be prepared, and existing fuel-bounded operations may now run out of fuel. The substrate's discipline is to declare regime changes explicitly.
- **Silent regime demotion.** A schema change that removes content the substrate's regime depends on is destructive — predications are invalidated without explicit retraction. The substrate refuses; per [retraction](../morphisms/retraction.md), removal must be recorded.
- **Cross-regime federation without translation.** Two substrates in different regimes federating without explicit regime-bridging are at risk of producing settlings the other cannot replay. Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), regime mismatch is a partial-trust signal.

## What the theorem requires

- The substrate's parameter base $B$ classifies into a regime per [base-admissibility-of-regimes](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/base-admissibility-of-regimes.md).
- The substrate's runtime is regime-aware (per [regime-classification-for-substrate](regime-classification-for-substrate.md)).
- The schema change is recorded as a base-morphism in the parameter-base category (per [parameter-base-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/parameter-base-category.md)).
- The substrate's existing predications are valid at the new base $B'$ (per [forward-migration-preserves-prior-content](forward-migration-preserves-prior-content.md)).

## Position

This theorem grounds the substrate's schema-evolution discipline in the predication-categories' regime classification. Together with [conformance-via-fiber-algebra-functor](conformance-via-fiber-algebra-functor.md) (conformance as functor exactness) and [doctrine-fidelity-via-faithful-interfacer-functor](doctrine-fidelity-via-faithful-interfacer-functor.md) (doctrine fidelity as functor faithfulness), it places the substrate's specification-evolution-conformance triad in the fibration's structural foundation. Schema-evolution moves the base; conformance verifies the operators realize their fibration functors; doctrine fidelity verifies external interfacers are faithful — three engineering surfaces of one structural framework.
