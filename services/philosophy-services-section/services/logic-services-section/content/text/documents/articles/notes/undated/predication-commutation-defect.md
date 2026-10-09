---
type: morphism
class: operator
symbol: "\\Delta_{F,G}"
status: draft
depends-on: [predicatory-commutation, predication-valuation, knowledge-order, truth-order]
see-also: [predicatory-equalization, evidence-residual, four-symmetric-evidence-difference]
title: Commutation defect
description: For two operational endomaps $F,G$ on a common valuation space, the commutation defect is the comparison profile
---

# Commutation defect

For two operational endomaps $F,G$ on a common valuation space, the **commutation defect** is the comparison profile

$$\Delta_{F,G}(v) := \mathrm{diff}\bigl(F(G(v)),\, G(F(v))\bigr),$$

where $\mathrm{diff}$ is a chosen predication-valued difference operator. In the strict Boolean quotient, $\Delta_{F,G}(v)=0$ exactly when the square commutes at $v$. In the bilattice setting, the defect should retain which coordinates differ and whether the difference is positive evidence, negative evidence, or both.

On $\mathbf{FOUR}$, the canonical total choice is the [FOUR symmetric evidence difference](../../research/2026/07/31/lenticule-import/from-predicate-category/four-symmetric-evidence-difference.md):

$$\Delta^{\oplus}_{F,G}(v) :=
\delta^{\oplus}_k\bigl(F(G(v)),\,G(F(v))\bigr).$$

By [FOUR symmetric evidence difference detects equality](../../research/2026/07/31/lenticule-import/theorems/four-symmetric-evidence-difference-detects-equality.md), this defect is $\bot$ exactly when $F(G(v))=G(F(v))$.

On $\mathbf{FOUR}$, a minimal defect record is cellwise:

| Pair of composite values | Defect reading |
|---|---|
| equal values | no defect |
| $\bot$ vs $\mathbf{t}$ | missing positive evidence on one side |
| $\bot$ vs $\mathbf{f}$ | missing negative evidence on one side |
| $\mathbf{t}$ vs $\mathbf{f}$ | contradiction between the composites |
| any value vs $\top$ | one side has contested evidence absent from the other |

This morphism is marked `draft` because the corpus has not yet fixed a single canonical $\mathrm{diff}$ operator for all bilattices. The [evidence residual](../../research/2026/07/31/lenticule-import/from-predicate-category/evidence-residual.md) supplies the monotone case $v \leq_k w$; $\mathbf{FOUR}$ has the symmetric evidence difference above; general non-Boolean twist products require a chosen coordinate-level apartness or symmetric-difference operation.
