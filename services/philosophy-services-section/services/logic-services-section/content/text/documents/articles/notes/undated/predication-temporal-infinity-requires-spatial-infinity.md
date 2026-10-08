---
type: theorem
status: proved
depends-on: [closure-ordinal, scott-continuous-closure, four-regime-dichotomy, predication-fiber-algebra, entity-set, predicate-category]
kind: theorem
title: Temporal infinity requires spatial infinity
description: "Temporal infinity — closure ordinal $\\kappa > \\omega$, i.e., the closure fails to stabilize at $\\omega$ — requires spatial infinity: finitary inference rules on a finite state space trivially stabilize within finite steps."
---

# Temporal infinity requires spatial infinity

Temporal infinity — closure ordinal $\kappa > \omega$, i.e., the closure fails to stabilize at $\omega$ — requires spatial infinity: finitary inference rules on a finite state space trivially stabilize within finite steps.

| | Spatial finite | Spatial infinite |
|---|---|---|
| **Finitary closure** | strict | Scott-continuous |
| **Infinitary closure** | strict (degenerate) | transfinite-bounded / aperiodic |

## Proof

If the [entity set](../../research/2026/07/31/lenticule-import/objects/entity-set.md) $E$ and [predicate category](../../research/2026/07/31/lenticule-import/objects/predicate-category.md) $\mathcal{C}$ are finite, the [predication fiber algebra](../../research/2026/07/31/lenticule-import/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie E \times E}$ is finite (assuming finite $\mathbf{L}$), and any monotone closure operator stabilizes on a finite ascending chain in finitely many steps. Infinitary inference rules require infinite antecedents, which require infinite $E$.

Temporal infinity specifically arises from quantifier-induced infinitary inference rules — for example, $\forall$-antecedents over infinite $E$ — which are the precise mechanism by which the hyperdoctrinal quantifier structure destabilizes finite-convergence theorems. $\square$
