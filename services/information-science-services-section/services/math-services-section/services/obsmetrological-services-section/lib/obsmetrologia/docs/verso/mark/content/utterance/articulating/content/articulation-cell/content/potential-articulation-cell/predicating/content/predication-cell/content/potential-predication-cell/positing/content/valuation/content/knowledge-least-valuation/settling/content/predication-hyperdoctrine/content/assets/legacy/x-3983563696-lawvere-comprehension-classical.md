---
type: theorem
status: proved
depends-on: [predication-hyperdoctrine, predicate-specialization, predicate-category, specialization-hyperdoctrinal-adjoints, truth-order]
kind: theorem
---

# Lawvere comprehension (classical / $\leq_t$-system)

For every $p \in \mathcal{C}$, the extension functor

$$\mathrm{Ext}^t : \mathcal{C}/p \to \mathcal{E}_p, \quad (g : q \to p) \mapsto \exists_g^t(\mathbf{1}_q^t)$$

— sending a [predicate specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) to the characteristic function of $\mathrm{dom}(q)$ (taking $\mathbf{t}$ on $\mathrm{dom}(q)$ and $\mathbf{f}$ elsewhere, by the [specialization hyperdoctrinal adjoints](specialization-hyperdoctrinal-adjoints.md)) — has a right adjoint

$$\{p : -\}_\mathbf{t} : \mathcal{E}_p \to \mathcal{C}/p$$

sending $\psi \in \mathcal{E}_p$ to the specialization $q_\psi \to p$ with $\mathrm{dom}(q_\psi) := \psi^{-1}(\mathbf{t})$.

## Proof

The adjunction $\mathrm{Ext}^t(g) \leq_t \psi \iff g$ factors through $\{p : \psi\}_\mathbf{t}$:

- $\mathrm{Ext}^t(g) \leq_t \psi$ means $\exists_g^t(\mathbf{1}_q^t)(s, o) \leq_t \psi(s, o)$ for all $(s, o)$. On $\mathrm{dom}(q)$: $\mathbf{t} \leq_t \psi(s, o) \iff \psi(s, o) = \mathbf{t}$ (since $\mathbf{t}$ is the [truth-order](../../../../../../../../../pre-bilattice/content/truth-order/truth-order.md) top). Off $\mathrm{dom}(q)$: $\mathbf{f} \leq_t \psi$, always. Conjoined: $\mathrm{dom}(q) \subseteq \psi^{-1}(\mathbf{t})$.
- $g$ factors through $\{p : \psi\}_\mathbf{t}$ iff $\mathrm{dom}(q) \subseteq \mathrm{dom}(q_\psi) = \psi^{-1}(\mathbf{t})$.

Same condition. $\square$
