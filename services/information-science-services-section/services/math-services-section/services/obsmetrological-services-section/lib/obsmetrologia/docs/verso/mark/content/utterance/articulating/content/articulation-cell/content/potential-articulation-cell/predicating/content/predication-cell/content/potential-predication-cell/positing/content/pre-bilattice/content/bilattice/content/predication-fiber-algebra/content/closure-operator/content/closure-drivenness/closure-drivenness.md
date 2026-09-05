---
type: concept
class: condition
depends-on: [predication-settling, closure-operator, increment-sequence, knowledge-order]
---

# Closure-drivenness

A [predication settling](../objects/predication-settling.md) $v = (v_\tau)_{\tau < \lambda}$ is **closure-driven** by a [closure operator](../morphisms/closure-operator.md) $\mathrm{cl} = (\mathrm{cl}_p)_{p \in \mathcal{C}}$ if each successor step has the form

$$v_{\tau+1}(p) = \mathrm{cl}_p\bigl(v_\tau(p) \vee_k u_{\tau+1}(p)\bigr)$$

for some [increment sequence](../objects/increment-sequence.md) $(u_\tau)_{\tau < \lambda}$, where $\vee_k$ is the [knowledge-order](knowledge-order.md) join, applied cellwise in each [predication fiber algebra](../objects/predication-fiber-algebra.md).

The increment $u_{\tau+1}$ is the new evidence introduced at step $\tau+1$; the successor value $v_{\tau+1}(p)$ is the closure of the join of the previous state $v_\tau(p)$ with the new increment $u_{\tau+1}(p)$.
