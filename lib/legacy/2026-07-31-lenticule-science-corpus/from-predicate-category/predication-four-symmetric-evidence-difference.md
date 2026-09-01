---
type: morphism
class: operator
symbol: "\\delta^{\\oplus}_k"
status: proved
depends-on: [predicatory-differentiation, four-bilattice, predication-valuation, knowledge-order]
see-also: [evidence-residual, commutation-defect, four-symmetric-evidence-difference-detects-equality]
---

# FOUR symmetric evidence difference

The **FOUR symmetric evidence difference** is the cellwise operator

$$\delta^{\oplus}_k(q,r) :=
\langle q_+ \oplus r_+,\; q_- \oplus r_- \rangle$$

on $\mathbf{FOUR} \cong \mathbf{2}^{\bowtie}$, where $q=\langle q_+,q_- \rangle$, $r=\langle r_+,r_- \rangle$, and $\oplus$ is exclusive-or in the Boolean coordinate lattice.

For predication valuations $v,w : \Phi \to \mathbf{FOUR}$, extend pointwise:

$$\delta^{\oplus}_k(v,w)(\phi) := \delta^{\oplus}_k(v(\phi), w(\phi)).$$

This is the canonical symmetric defect operator for calculators that compare two outputs which need not be comparable in $\leq_k$. The [evidence residual](evidence-residual.md) answers "what must be added to get from $v$ to $w$?" when $v \leq_k w$. The symmetric evidence difference answers "which evidence coordinates differ?" for any pair.

## Table

Writing rows as the first argument and columns as the second:

| $\delta^{\oplus}_k$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
| $\mathbf{t}$ | $\mathbf{t}$ | $\bot$ | $\top$ | $\mathbf{f}$ |
| $\mathbf{f}$ | $\mathbf{f}$ | $\top$ | $\bot$ | $\mathbf{t}$ |
| $\top$ | $\top$ | $\mathbf{f}$ | $\mathbf{t}$ | $\bot$ |

The output is itself a predication value: $\mathbf{t}$ means the positive-evidence coordinate differs, $\mathbf{f}$ means the negative-evidence coordinate differs, $\top$ means both coordinates differ, and $\bot$ means no coordinate differs.

## Calculator role

For two operational endomaps $F,G$ on FOUR-valued valuations, the strict commutation defect can be computed as

$$\Delta^{\oplus}_{F,G}(v) :=
\delta^{\oplus}_k(F(G(v)), G(F(v))).$$

Then $\Delta^{\oplus}_{F,G}(v)=\bot$ exactly when the square commutes at $v$, while non-$\bot$ values retain the predicatory shape of the failure.
