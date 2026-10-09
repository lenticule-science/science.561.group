---
kind: theorem
status: proved
depends-on: [spatiotemporal-knowledge-presheaf, settling-continuity, closure-drivenness, closure-driven-settling-monotonicity, closure-operator, predication-fiber-algebra, settling-quiescence, residuated-lattice, entity-set, predicate-category, settling-bound, increment-sequence, knowledge-order]
---

# Settling convergence

Let $v$ be a [settling-continuous](../../settling-continuity/settling-continuity.md), [closure-driven](../concepts/closure-drivenness.md) [spatiotemporal knowledge presheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/spatiotemporal-knowledge-presheaf.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with the [residuated lattice](../objects/residuated-lattice.md) $\mathbf{L}$, the [entity set](../objects/entity-set.md) $E$, and the [predicate category](../objects/predicate-category.md) $\mathcal{C}$ all finite, and the [settling bound](../objects/settling-bound.md) $\lambda \geq \omega$. Suppose the [increment sequence](../objects/increment-sequence.md) $(u_\tau)$ is **eventually zero**: there exists $\tau_0$ such that $u_\tau(p) = \bot$ for all $\tau > \tau_0$ and all $p$. Then there exists $\tau^* < \tau_0 + \omega$ at which $v$ is [quiescent](../../settling-quiescence/settling-quiescence.md).

## Proof

After $\tau_0$, the settling evolves only by closure:

$$v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p)) \quad \text{for } \tau \geq \tau_0.$$

By [closure-driven settling monotonicity](../../settling-monotonicity/references/closure-driven-settling-monotonicity.md), $(v_\tau(p))_{\tau \geq \tau_0}$ is a $\leq_k$-ascending chain in the [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_p$, where $\leq_k$ is the [knowledge order](../concepts/knowledge-order.md). Since $\mathbf{L}$ and $E$ are finite, $A_p = \mathbf{L}^{\bowtie E \times E}$ is finite, hence every ascending chain stabilizes in finitely many steps. Let $\tau^*(p) < \tau_0 + \omega$ be the stabilization ordinal for predicate $p$. Since $\mathcal{C}$ is finite, $\tau^* := \max_{p \in \mathcal{C}} \tau^*(p) < \tau_0 + \omega$ stabilizes the settling globally. $\square$

## Corollary

Every settling-continuous closure-driven knowledge presheaf with finite $\mathbf{L}, E$, and $\mathcal{C}$ and eventually-zero increments is quiescent at some $\tau^* < \omega$. Setting $\tau_0 = 0$ — all increments happening at once at the start — yields this finite bound.
