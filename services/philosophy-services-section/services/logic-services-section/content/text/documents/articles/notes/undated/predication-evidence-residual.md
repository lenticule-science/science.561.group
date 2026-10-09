---
type: morphism
class: operator
symbol: "\\partial_k"
status: draft
depends-on: [predicatory-differentiation, predication-valuation, knowledge-order, twist-product, four-bilattice]
see-also: [commutation-defect, resource-deficit]
title: Evidence residual
description: The evidence residual $\partialk(v,w)$ is the predication-native "difference" from $v$ to $w$ when $v \leqk w$.
---

# Evidence residual

The **evidence residual** $\partial_k(v,w)$ is the predication-native "difference" from $v$ to $w$ when $v \leq_k w$. It records the least evidence profile which, when knowledge-joined to $v$, reaches $w$:

$$v \vee_k \partial_k(v,w) = w.$$

In a Boolean twist product $\mathbf{FOUR} \cong \mathbf{2}^\bowtie$, write values as pairs $\langle q_+,q_- \rangle$. If $v(\phi) \leq_k w(\phi)$, define

$$\partial_k(v,w)(\phi) :=
\langle\, w_+(\phi) \wedge \neg v_+(\phi),\; w_-(\phi) \wedge \neg v_-(\phi)\,\rangle.$$

Thus:

| From | To | Residual |
|---|---|---|
| $\bot$ | $\mathbf{t}$ | $\mathbf{t}$ |
| $\bot$ | $\mathbf{f}$ | $\mathbf{f}$ |
| $\bot$ | $\top$ | $\top$ |
| $\mathbf{t}$ | $\top$ | $\mathbf{f}$ |
| $\mathbf{f}$ | $\top$ | $\mathbf{t}$ |
| $q$ | $q$ | $\bot$ |

For non-Boolean $\mathbf{L}$, the same definition requires a residual or relative-complement operation in the underlying lattice. Where that operation does not exist, $\partial_k$ is not canonical; one must use a lower/upper residual interval or keep the ordered pair $(v,w)$ as the difference witness.

