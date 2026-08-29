---
kind: theorem
status: proved
depends-on: [spatiotemporal-knowledge-presheaf, settling-continuity, closure-drivenness, closure-operator, knowledge-order, settling-monotonicity]
---

# Closure-driven settling monotonicity

Let $v = (v_\tau)_{\tau < \lambda}$ be a [settling-continuous](../concepts/settling-continuity.md), [closure-driven](../concepts/closure-drivenness.md) [spatiotemporal knowledge presheaf](../objects/spatiotemporal-knowledge-presheaf.md).
Then for every [predicate](../concepts/predicate.md) $p$, the sequence $(v_\tau(p))_{\tau < \lambda}$ is $\leq_k$-monotone in the [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p$.

## Proof

**Successor step.** From the closure-driven definition,

$$v_{\tau+1}(p) = \mathrm{cl}_p\bigl(v_\tau(p) \vee_k u_{\tau+1}(p)\bigr) \geq_k v_\tau(p) \vee_k u_{\tau+1}(p) \geq_k v_\tau(p),$$

using inflationarity of $\mathrm{cl}_p$ — axiom (2) of the [closure operator](../morphisms/closure-operator.md) — and the lattice property $a \leq_k a \vee_k b$.

**Limit step.** By settling continuity, $v_\mu(p)$ is the cellwise $\vee_k$-colimit of $\{v_\sigma(p) : \sigma < \mu\}$, and every earlier element is below it by the cocone property. $\square$

## Corollary

A closure-driven settling-continuous knowledge presheaf automatically satisfies the [settling monotonicity](../concepts/settling-monotonicity.md) axiom: settling monotonicity is implied by these two conditions, rather than independently required.
