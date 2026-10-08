---
kind: theorem
status: proved
depends-on: [predication-hyperdoctrine, classical-equality, paraconsistent-equality, lawvere-comprehension-classical, lawvere-comprehension-paraconsistent, truth-order, knowledge-order]
type: theorem
title: Two internal logics on every predication hyperdoctrine
description: "Every predication hyperdoctrine $\\mathcal{E}$ supports:"
---

# Two internal logics on every predication hyperdoctrine

Every [predication hyperdoctrine](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/objects/predication-hyperdoctrine.md) $\mathcal{E}$ supports:

- A **classical first-order theory** $T_t(\mathcal{E})$ over the [truth-order](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) adjoint system, with [classical equality](../../documents/articles/notes/undated/classical-equality.md) $=_E$ and [classical Lawvere comprehension](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-classical.md) $\{-\}_\mathbf{t}$.

- A **paraconsistent first-order theory** $T_k(\mathcal{E})$ over the [knowledge-order](../../documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-3/concepts/knowledge-order.md) adjoint system, with [paraconsistent equality](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/paraconsistent-equality/paraconsistent-equality.md) $\Delta_E^k$ and [paraconsistent Lawvere comprehension](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-paraconsistent.md) $\{-\}_\top$.

These theories are distinct: a sentence derivable in one need not be derivable in the other.

## Proof

The two systems have different adjoints, different equalities, different comprehension. A concrete example of divergence: $\forall x, y.\, x = y \vee x \neq y$ is classically derivable from excluded middle on $=_E$, which is two-valued, but is not paraconsistently derivable — $\Delta_E^k$ admits $\top$ as a non-classical value at off-diagonal cells in inconsistent states. $\square$

## Remark

Applications select the logic matching their intended semantics:

- *Distributed / CRDT / paraconsistent reasoning:* use $T_k$. The $\top$ on the diagonal of $\Delta_E^k$ means "information-maximal"; $\bot$ off means "no claim." Stable under $\vee_k$-merge.
- *Classical knowledge-base / database queries:* use $T_t$. Two-valued, compatible with classical entailment.
- *Paraconsistent KR with designated values* (e.g., [@ma-hitzler2009]): use $T_k$, treating $\top$-cells as conflicts that do not trivialize.

Both logics are internal to the same fibration; queries can be framed in either.
