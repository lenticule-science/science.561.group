---
kind: definition
realizes: [closure-drivenness]
type: coalgebra
depends-on: [predication-hyperdoctrine, settling-bound, settling-monotonicity, predication-fiber-algebra, knowledge-order, increment-sequence]
---

# Settling-equipped predication hyperdoctrine

A **settling-equipped predication hyperdoctrine** — the 2-categorical realization of a *spatiotemporal knowledge presheaf* — over $(\mathbf{L}, \mathcal{C}, E, \lambda)$ is a pair $(\mathcal{E}, c)$ where:

**(C1)** $\mathcal{E}$ is a [predication hyperdoctrine](predication-hyperdoctrine.md).

**(C2)** $c : \mathcal{E} \to F_U(\mathcal{E})$ is a coalgebra for the [settling endofunctor](settling-endofunctor.md) $F_U$ on the 2-category $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ of [predication fibrations](predication-fibration.md), parametrized by an [increment sequence](increment-sequence.md) $U = (u_\tau)_{\tau < \lambda}$.

**(C3) Settling monotonicity.** The orbit $(v_\tau)_{\tau < \lambda}$ derived from $c$ satisfies $\sigma \leq \tau \Rightarrow v_\sigma \leq_k v_\tau$ pointwise, at every [predicate](../concepts/predicate.md) $p$ and every [predication cell](../concepts/predication-cell.md) $(s, o)$, where $\leq_k$ is the [knowledge order](../concepts/knowledge-order.md).

The orbit is defined by $v_0 = \mathcal{E}$ and $v_{\tau+1} = F_U^{\tau+1}(\mathcal{E})$ at successor ordinals, $v_\mu = \bigvee_k\{v_\sigma : \sigma < \mu\}$ at limit ordinals (settling continuity).

## Recovery of the 1-truncation

In the strict and Scott-continuous regimes ($\kappa \leq \omega$), $\mathcal{E}$ reduces to the [predication fiber functor](../theorems/predication-fiber-functor.md) of the 1-truncation; the settling coalgebra $c$ reduces to the settling family $(v_\tau)$; and (C3) reduces to the [settling monotonicity](../concepts/settling-monotonicity.md) axiom of the [spatiotemporal knowledge presheaf](spatiotemporal-knowledge-presheaf.md).
The 1-truncated knowledge presheaf definition is the 1-categorical projection of the settling-equipped hyperdoctrine.

## $\mathcal{C}$-closed presheaves as closure-algebras

[Predicate-category naturality](../concepts/predicate-category-naturality.md) is equivalently the state being an algebra for the [closure 2-monad](closure-2-monad.md) $\mathrm{Cl}$.
By Kelly–Lack's property-like theorem, this is a property — unique up to unique iso.

A fully $\mathcal{C}$-closed settling-equipped hyperdoctrine is equivalent to a presheaf $\mathbf{M} : \mathcal{C}^{\mathrm{op}} \times \lambda \to \mathbf{DBiLat}_*(\mathbf{L})$ into the category of pointed distributive bilattices, sending $(p, \tau)$ to the pointed algebra $(A_p, v_\tau(p))$.
The total coalgebra $c : \mathcal{E} \to F_U(\mathcal{E})$, when every state is a closure-algebra, admits a transpose to a $\lambda$-indexed family of pseudo-functors $\mathcal{C}^{\mathrm{op}} \to \mathbf{DBiLat}_*$.
The name "spatiotemporal knowledge presheaf" is recovered as an algebra-theoretic consequence.
