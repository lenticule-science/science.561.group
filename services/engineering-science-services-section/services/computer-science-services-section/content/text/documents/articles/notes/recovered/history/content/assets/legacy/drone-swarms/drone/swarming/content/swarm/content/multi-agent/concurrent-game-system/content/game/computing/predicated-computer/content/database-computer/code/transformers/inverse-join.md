---
type: morphism
class: data-access-operation
realizes: [query-planning]
depends-on: [predicate-converse, predicate-converse-quantifier-adjoints, predication-fiber-algebra, query-language, query-plan-record, witness]
see-also: [inverse-join-as-converse-self-adjoint, plan-query, query-planning]
---

# Inverse join

The substrate operation that *traverses a predicate in the converse direction*, producing the same join result as the forward traversal under the swap of the entity-pair index $(s, o) \mapsto (o, s)$.

## Signature

`inverse-join(p, query-expression-on-p^c) → (result, traversal-witness)`

Inputs:

- **`p`** — the predicate whose [converse](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md) $p^c$ the query is to be evaluated against.
- **`query-expression-on-p^c`** — the query expressed in terms of $p^c$ (i.e., reading the predicate "subject-direction").

Outputs:

- **`result`** — the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) section satisfying the query.
- **`traversal-witness`** — records that the substrate served the query through the converse rather than the forward predicate, for plan-audit purposes.

## Operational semantics

The substrate evaluates the query by:

1. Reading the query-expression's free variables and rewriting them along the converse swap $(s, o) \mapsto (o, s)$.
2. Looking up the result in the *same* fiber data the forward join uses — per [inverse-join-as-converse-self-adjoint](../theorems/inverse-join-as-converse-self-adjoint.md), $f^*$ for the converse $f : p^c \to p$ acts by the swap on cell coordinates and produces the same value.
3. Emitting `traversal-witness` recording the traversal direction.

No second copy of the predicate's data is consulted. The substrate is not maintaining "an index in the other direction": per the converse self-adjointness, the same fiber-algebra entries serve both directions.

## Engineering invariants

- **Direction-symmetric correctness.** Forward and inverse joins on the same predicate produce the same fiber-algebra section after the swap. Per [inverse-join-as-converse-self-adjoint](../theorems/inverse-join-as-converse-self-adjoint.md), this holds without any choice of existential vs universal lifting — for a converse, the two coincide with $f^*$.
- **Hyperdoctrinal-cost-symmetric.** The hyperdoctrinal cost of an inverse join equals the cost of the corresponding forward join. Substrate-implementation costs may differ (cache locality, page layout) but those are below the engineering claim's level.
- **Witnessed.** Per [witness](../../../objects/witness.md), the traversal direction is recorded and the substrate's audit machinery distinguishes inverse from forward traversal even though both produce the same result.

## What this rules out

- **Maintaining a separate "reverse index" for correctness.** A substrate that requires an explicit reverse index in order to answer inverse queries is not exploiting the converse self-adjointness. Reverse indexes may exist as a [secondary-index](teaching/explanations/secondary-index.md) for *cost* reasons (locality), but they are not required for *correctness*.
- **Plans that pick existential vs universal liftings for converse traversal.** The two coincide; a planner that computes them as alternatives is wasting cycles. The planner must recognize the converse case and skip the comparison.
- **Asymmetric isolation discipline.** A forward join and the corresponding inverse join read at the same $\leq_k$-position per [transaction-isolation-as-knowledge-order-position](../theorems/transaction-isolation-as-knowledge-order-position.md); the substrate does not admit "the inverse can read at a stronger or weaker isolation than the forward."

## Position in the platform

Inverse-join is a primitive [query-planning](teaching/explanations/query-planning.md) move complementary to [predicate-pushdown-via-frobenius](../../../theorems/predicate-pushdown-via-frobenius.md) and [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md). Where pushdown reorders filters and Beck-Chevalley reorders quantifier positions, inverse-join reverses traversal direction; the three together exhaust the substrate's structural query rewrites.
