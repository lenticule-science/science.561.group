---
type: concept
class: data-access-discipline
depends-on: [query-language, secondary-index, index, witness, frobenius-for-knowledge-and-truth-meets, beck-chevalley-commutation-on-predication-bilattices, predicate-converse-quantifier-adjoints]
see-also: [materialized-view, predicate-pushdown-via-frobenius, join-reordering-via-beck-chevalley, inverse-join, inverse-join-as-converse-self-adjoint, where-clause-as-paraconsistent-comprehension]
---

# Query planning

The *substrate-recorded discipline for translating high-level queries into efficient execution plans*. Per the [predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md)'s structural properties, query optimization is the substrate's application of two foundational equivalences:

- **Frobenius reciprocity** (per [frobenius-for-knowledge-and-truth-meets](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/frobenius-for-knowledge-and-truth-meets.md)): $\exists_f(f^*\alpha \wedge \phi) \cong \alpha \wedge \exists_f \phi$ — *predicate pushdown*. Filters that don't depend on a quantifier's bound variable can be moved outside the quantifier.
- **Beck-Chevalley** (per [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md)): $\exists$ and $\forall$ commute with pullbacks. Engineering: *join reordering* — the order in which the substrate computes a multi-way join can be chosen for efficiency without changing the result.
- **Converse self-adjointness** (per [predicate-converse-quantifier-adjoints](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-converse-quantifier-adjoints.md)): $\exists_f^{k/t} = f^* = \forall_f^{k/t}$ for the converse $f : p^c \to p$. Engineering: *inverse join* — traversing a predicate in the inverse direction is correctness-equivalent to the forward traversal under the swap of cell coordinates, with no choice between existential and universal liftings to resolve. See [inverse-join-as-converse-self-adjoint](../theorems/inverse-join-as-converse-self-adjoint.md).

Per [predicate-pushdown-via-frobenius](../../../theorems/predicate-pushdown-via-frobenius.md), [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md), and [inverse-join-as-converse-self-adjoint](../theorems/inverse-join-as-converse-self-adjoint.md), these are the substrate's foundational query-rewrite rules. Query planning composes these rewrites with cost-based plan selection.

The planner additionally records, for each query, the **designation** of its `WHERE` clauses per [where-clause-as-paraconsistent-comprehension](../theorems/where-clause-as-paraconsistent-comprehension.md): which sub-support of the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) the comprehension selects ($\psi^{-1}(\mathbf{t})$ for the SQL-standard reading, $\psi^{-1}(\top)$ for the information-witnessing reading, and the principal up-sets in between). The designation is orthogonal to the $\leq_k$-position selected by the [transaction-isolation-level](transaction-isolation-level.md); a coherent query specifies both.

A query plan has the structure:

- **Operations.** Per the hyperdoctrine's primitives: index scans (substrate's [index](../../teaching/explanations/index.md)), predicate filters ($\wedge$ with cell-atoms), quantifier expansions ($\exists_f$ / $\forall_f$), comprehension applications ($\{p : -\}$), aggregations.
- **Cost estimates.** Per-operation cost based on substrate statistics (cardinality, index selectivity, data distribution).
- **Total cost estimate.** Sum of per-operation costs.
- **Selected plan.** The lowest-cost plan among considered alternatives.

The query planner:

1. Parse the query into a hyperdoctrine expression.
2. Apply Frobenius rewrites to push predicates as deep as possible (per [predicate-pushdown-via-frobenius](../../../theorems/predicate-pushdown-via-frobenius.md), the rewrites preserve correctness).
3. Apply Beck-Chevalley rewrites to consider alternative join orders (per [join-reordering-via-beck-chevalley](../../../theorems/join-reordering-via-beck-chevalley.md), correctness is preserved).
4. For each candidate ordering, identify which [indexes](../../teaching/explanations/index.md) apply.
5. Estimate cost per candidate.
6. Pick the cheapest.
7. Execute.

Per [self-representation](../../teaching/explanations/self-representation.md), the query planner's logic and statistics are substrate content. Per [witness](../../../objects/witness.md), each query's chosen plan is recorded — auditors can review query plans for bottleneck investigation.

Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), query-plan correctness is testable: regardless of plan, the same query against the same state produces the same result. The hyperdoctrinal foundation guarantees this — Frobenius and Beck-Chevalley are *equivalences*, not approximations.

## What changes from the substrate's bilattice setting

In a generic predication-hyperdoctrine, Frobenius holds for $\wedge_k$ and $\wedge_t$ but **not for $\odot$** (per [predication-hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md)'s "Frobenius for $\odot$ fails" remark). Engineering implication: queries involving the substrate's twist-product fusion $\odot$ (typically dispatch-style queries — per [dispatch-composes-authorization](../../agential-orchestration-platform/theorems/dispatch-composes-authorization.md)) **cannot** be optimized via Frobenius pushdown. The query planner must recognize $\odot$-expressions and refrain from applying the rewrite there.
