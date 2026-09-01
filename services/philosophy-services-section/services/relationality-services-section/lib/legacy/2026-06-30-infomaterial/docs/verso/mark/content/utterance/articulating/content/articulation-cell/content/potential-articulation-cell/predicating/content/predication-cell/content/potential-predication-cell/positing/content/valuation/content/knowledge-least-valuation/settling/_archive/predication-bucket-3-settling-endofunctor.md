---
kind: morphism
realizes: [closure-drivenness]
type: 2-functor
symbol: "F_U"
closes: spatiotemporal-knowledge-presheaf
depends-on: [closure-2-monad, predication-fibration, predication-hyperdoctrine, increment-sequence, knowledge-order]
---

# Settling endofunctor

Given an [predication hyperdoctrine](../objects/predication-hyperdoctrine.md) $\mathcal{E}$ and an [increment sequence](../objects/increment-sequence.md) $U = (u_\tau)_{\tau < \lambda}$, the **settling endofunctor**

$$F_U : \mathbf{PrFib}(\mathcal{C}) \to \mathbf{PrFib}(\mathcal{C})$$

on the 2-category of [predication fibrations](../objects/predication-fibration.md) is defined by

$$F_U(\mathcal{E})_\tau := \mathrm{Cl}(\mathcal{E}) \vee_k u_\tau,$$

where $\mathrm{Cl}$ is the [closure 2-monad](closure-2-monad.md) and $\vee_k u_\tau$ is fiberwise [knowledge-order](../concepts/knowledge-order.md) join with the increment at step $\tau$.

At each settling step, the settling endofunctor first applies closure — saturating the state under derivable consequences — then merges in new external evidence. The settling orbit of a [settling-equipped predication hyperdoctrine](../objects/settling-coalgebra-structure.md) is the orbit of $F_U$ from the initial state $v_0 = \mathcal{E}$.
