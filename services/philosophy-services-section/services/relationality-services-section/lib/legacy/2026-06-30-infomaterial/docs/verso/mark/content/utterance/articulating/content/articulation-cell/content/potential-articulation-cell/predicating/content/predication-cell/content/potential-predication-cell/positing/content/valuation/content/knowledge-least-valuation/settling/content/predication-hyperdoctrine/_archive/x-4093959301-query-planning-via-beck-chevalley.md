---
type: theorem
class: engineering-claim
status: proved
depends-on: [query-planning, query-plan-record, plan-query, predication-fibration, beck-chevalley-commutation-on-predication-bilattices, predicate-pushdown-via-frobenius, join-reordering-via-beck-chevalley, predication-fiber-algebra]
see-also: [secondary-index-as-alexandrov-cover, materialized-view-as-functorial-projection-cache]
---

# Query plan rewrites are sound iff they preserve Beck–Chevalley squares

**Claim.** Let a query be a composite of [predicate-category](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) morphisms (specialization $f$, converse, projections) and [twist-product fusions](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) on the substrate's [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). A query-planner rewrite — predicate pushdown, join reordering, projection elimination, index substitution — is *semantically sound* (returns the same fiber-algebra value as the original plan on every substrate state) **if and only if** the rewrite corresponds to a Beck–Chevalley square in the [predication fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).

## Why this holds

A query plan is a chain of reindexing functors $f^* : A_{p'} \to A_p$ and intra-fiber operations $\wedge_t, \wedge_k, \odot$. Two plans return the same value iff their composite functors are naturally isomorphic on the fiber-algebra. Per the [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) theorem, the canonical mate $f^* \exists_g \to \exists_{g'} f'^*$ along a pullback square in the predicate category is invertible exactly when the square is Beck–Chevalley. Each soundness-preserving plan rewrite is exactly such a mate.

Specifically:

- **Predicate pushdown** through $\wedge_k / \wedge_t$ is the rewrite licensed by [predicate-pushdown-via-frobenius](../../predicate-pushdown-via-frobenius.md): $f^*(\alpha \wedge \beta) = f^*\alpha \wedge f^*\beta$ when $\beta = f^*\beta'$. The corresponding Beck–Chevalley square is the pullback of the filter predicate along the join's projection.
- **Join reordering** is the rewrite licensed by [join-reordering-via-beck-chevalley](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/join-reordering-via-beck-chevalley.md): two joins commute when the underlying predicate-category square is a pullback.
- **Projection elimination** (dropping a $\exists_g$ followed by $g^*$) is the unit/counit of the projection adjunction, sound when the unit is iso — equivalently, when the corresponding Beck–Chevalley square is degenerate.

Per [predication-fibration](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) (A3), reindexing preserves the bilattice-residuated structure pointwise, so each Beck–Chevalley-licensed rewrite preserves the value on every fiber.

Conversely, a rewrite that is *not* a Beck–Chevalley square fails to preserve the value: the canonical mate is not invertible, so the two plans diverge on some substrate state. The query-planner that emits such a rewrite is unsound.

## Engineering consequence

- **The query planner's rewrite catalog is a list of Beck–Chevalley squares.** Each entry is licensed by a theorem in the predication-categories corpus; ad hoc rewrites without a corresponding square are forbidden.
- **The planner is statically auditable.** Per [conformance-via-fiber-algebra-functor](../../conformance-via-fiber-algebra-functor.md), a planner conforms to the substrate iff every rewrite it issues is a square in the fibration; the conformance test is decidable.
- **Cost models live in the quantale grade.** Per [graded-dispatch-via-q-enriched-fusion](../../graded-dispatch-via-q-enriched-fusion.md), choosing among Beck–Chevalley-equivalent plans by cost is q-enriched-fusion-graded selection — the "value" is unchanged but the "grade" is minimized.
- **Federation-stable plans.** Per the fibration's natural action across substrates, a plan that rewrites soundly on one substrate rewrites soundly on every federated peer.

## What the theorem rules out

- **Non-distributive pushdown of $\odot$.** Per [predicate-pushdown-via-frobenius](../../predicate-pushdown-via-frobenius.md), $\odot$ is not Frobenius; pushing $\odot$ through $f^*$ has no Beck–Chevalley square in general. The planner refuses such rewrites.
- **Reordering across non-pullback diagrams.** A "join reorder" not backed by a pullback square is not a Beck–Chevalley equivalence; it produces a different fiber value.
- **Heuristic projection elimination.** Eliminating an $\exists_g \circ g^*$ when the unit is not iso is unsound.

## Position

Together with [secondary-index-as-alexandrov-cover](secondary-index-as-alexandrov-cover.md) (index-driven access plans) and [materialized-view-as-functorial-projection-cache](materialized-view-as-functorial-projection-cache.md) (precomputed plan results), this theorem grounds the database-platform's query planner in the predication-fibration's coherence structure. The planner is not heuristic — its rewrite catalog is theorem-backed, its conformance is decidable, and its cost model is quantale-graded.
