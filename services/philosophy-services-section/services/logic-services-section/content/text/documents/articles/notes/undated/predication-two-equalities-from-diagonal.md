---
type: example
depends-on: [classical-equality, paraconsistent-equality, predicate-specialization, predicate-converse-quantifier-adjoints, knowledge-order, truth-order, four-bilattice]
instantiates: [classical-equality, paraconsistent-equality, two-internal-logics]
title: Two equalities from the same diagonal
description: Data.
---

# Two equalities from the same diagonal

**Data.** [Entity set](../../research/2026/07/31/lenticule-import/objects/entity-set.md) $E = \{p_1, p_2, a\}$ (same as the [adult-parent settling](../../research/2026/07/31/lenticule-import/from-predicate-category/adult-parent-settling.md)). Diagonal [specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E = \{(p_1, p_1), (p_2, p_2), (a, a)\}$ and $\mathrm{dom}(p) = E \times E$.

**$\leq_k$-equality $\Delta_E^k$.** Apply $\exists_g^k$ to constant-$\top$ on $q$:

| Cell | $\Delta_E^k$ |
|---|---|
| $(p_1, p_1), (p_2, p_2), (a, a)$ | $\top$ |
| six off-diagonal cells | $\bot$ |

This is the [paraconsistent equality](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/paraconsistent-equality/paraconsistent-equality.md) of [Lawvere comprehension (paraconsistent)](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-paraconsistent.md).

**$\leq_t$-equality $=_E$.** Apply $\exists_g^t$ to constant-$\mathbf{t}$ on $q$:

| Cell | $=_E$ |
|---|---|
| $(p_1, p_1), (p_2, p_2), (a, a)$ | $\mathbf{t}$ |
| six off-diagonal cells | $\mathbf{f}$ |

This is the [classical equality](../../research/2026/07/31/lenticule-import/objects/classical-equality.md) of [Lawvere comprehension (classical)](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-classical.md).

**Interpretation.** Both equalities derive from the same diagonal specialization $g$, differing only in which adjoint system supplies the $\exists$. $\Delta_E^k$ is information-maximal on the diagonal; $=_E$ is classically two-valued. Neither is postulated; both are forced by the [two adjoint systems](../../research/2026/07/31/lenticule-import/theorems/two-internal-logics.md) on a single fibration.

**Use cases.**

- *CRDT / distributed.* $\Delta_E^k$ is stable under $\vee_k$-merge — the natural choice for replicated knowledge.
- *Classical KR.* $=_E$ is compatible with two-valued entailment — the natural choice when paraconsistency is not wanted.
- *Paraconsistent reasoning.* $\Delta_E^k$ treats $\top$ as non-trivializing conflict on the diagonal.

**Regime.** Strict. Both equalities are finite constructions; $\kappa = 0$.

**Role.** The clearest exhibit of the structural distinction between the present formalism and Maruyama-style single-adjoint hyperdoctrines: two rigorously derived parallel first-order logics on one [predication hyperdoctrine](../../research/2026/07/31/lenticule-import/objects/predication-hyperdoctrine.md), with different internal equality predicates, both arriving without postulates.
