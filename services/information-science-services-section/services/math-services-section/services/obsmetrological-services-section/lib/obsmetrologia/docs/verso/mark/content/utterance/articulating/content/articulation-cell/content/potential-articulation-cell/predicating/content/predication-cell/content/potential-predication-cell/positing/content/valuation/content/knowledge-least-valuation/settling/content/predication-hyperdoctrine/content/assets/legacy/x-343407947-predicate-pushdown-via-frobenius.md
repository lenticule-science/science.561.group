---
type: theorem
class: engineering-claim
status: proved
depends-on: [query-language, query-planning, predication-hyperdoctrine, frobenius-for-knowledge-and-truth-meets, settlement-determinism]
see-also: [join-reordering-via-beck-chevalley]
---

# Predicate pushdown is correct via Frobenius reciprocity

**Claim.** For any [query](query.md) of the form

$$Q_1 = \exists_f^\bullet (f^* \alpha \wedge_\bullet \phi)$$

where $\alpha$ doesn't depend on $f$'s bound variable and $\bullet \in \{k, t\}$, the substrate's query planner may rewrite $Q_1$ as

$$Q_2 = \alpha \wedge_\bullet \exists_f^\bullet \phi$$

producing the same result. Per [frobenius-for-knowledge-and-truth-meets](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/frobenius-for-knowledge-and-truth-meets.md), $Q_1 \cong Q_2$ as elements of the [predication hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md)'s fiber.

This is the substrate-level instance of *predicate pushdown* — moving filters as deep into the query plan as possible to reduce intermediate result size.

## Why this holds

Direct from Frobenius reciprocity for $\wedge_k$ and $\wedge_t$ (per [frobenius-for-knowledge-and-truth-meets](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/frobenius-for-knowledge-and-truth-meets.md)):

$$\exists_f^k(f^*\alpha \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k \phi, \qquad \exists_f^t(f^*\alpha \wedge_t \phi) \cong \alpha \wedge_t \exists_f^t \phi.$$

Per [settlement-determinism](settlement-determinism.md), the substrate's query execution is deterministic on the query expression. Two equivalent expressions produce the same result.

## Engineering consequence

- **Query optimization is mathematically grounded.** Per [query-planning](theories/database-platform/concepts/query-planning.md), the substrate's planner can apply pushdown without ad-hoc justification.
- **Predicate pushdown is bidirectional.** The rewrite goes both ways — push or pull — depending on which form is cheaper to execute.
- **Index utilization improves.** Filters pushed close to scans can use indexes that wouldn't apply to filters above quantifiers.

## What the theorem rules out

- **Pushdown does not apply to twist-product fusion $\odot$.** Per [predication-hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md), Frobenius for $\odot$ fails on three of the four predicate-category generator classes. Queries involving $\odot$ (per [dispatch-composes-authorization](theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md)) cannot be optimized via this rewrite.
- **Pushdown does not apply when $\alpha$ depends on $f$'s bound variable.** The rewrite requires $\alpha = f^* \alpha'$ for some $\alpha'$ on the codomain — i.e., $\alpha$ doesn't reference variables that $f$ binds.

## What the theorem requires

- The substrate's value-domain is a [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) per [predication-hyperdoctrine](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md).
- The connective is $\wedge_k$ or $\wedge_t$ (not $\odot$).
- The cited $f$ is a [predicate-category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) generator (per [predicate-generator-exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md)).
