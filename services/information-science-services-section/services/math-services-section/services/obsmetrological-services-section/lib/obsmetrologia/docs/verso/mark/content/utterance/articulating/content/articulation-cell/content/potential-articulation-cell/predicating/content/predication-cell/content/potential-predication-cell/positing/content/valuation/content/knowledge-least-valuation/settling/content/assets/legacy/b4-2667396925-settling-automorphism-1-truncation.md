---
type: theorem
status: proved
depends-on: [predication-settling, settling-morphism, predication-fiber-algebra, knowledge-order, predication-fibration]
---

# Settling automorphisms are 1-truncated

For every [predication settling](../objects/predication-settling.md) $v$ over every base $(\mathbf{L}, \mathcal{C}, E, \lambda)$, the automorphism 2-group $\mathrm{Aut}^\simeq(v)$ — the group of invertible [settling-morphisms](../morphisms/settling-morphism.md) $v \to v$ — is 1-truncated: every invertible 2-cell between parallel 1-cells of $\mathrm{Aut}^\simeq(v)$ is an identity. Equivalently, $\mathrm{Aut}^\simeq(v)$ is a 1-group.

## Proof

Each fiber of an [predication fibration](../objects/predication-fibration.md) is the [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_q = \mathbf{L}^{\bowtie E \times E}$ viewed as a $\leq_k$-poset — a *thin* 1-category, meaning each hom-set has at most one element.

The ambient 2-category $\mathbf{PrFib}(\mathbf{L}, \mathcal{C}, E)$ has as 2-cells natural transformations of fibration morphisms; a 2-cell $\alpha : \phi \Rrightarrow \psi$ between parallel 1-cells $\phi, \psi : v \to v$ is determined by its components at each object of $v$, each of which is a 1-cell in the target fiber. The target fibers being thin, each component is an inequality $\phi(z) \leq_k \psi(z)$ in the [knowledge order](../concepts/knowledge-order.md).

An *invertible* 2-cell additionally requires $\psi(z) \leq_k \phi(z)$, hence $\phi(z) = \psi(z)$ for every $z$ — i.e., $\phi = \psi$ as 1-cells. Invertible 2-cells $\alpha : \phi \Rrightarrow \psi$ therefore exist only when $\phi = \psi$, in which case $\alpha$ is the identity 2-cell. $\square$

## Consequence: the moduli is 1-categorical

The moduli of settlings is a 1-stack, not a 2-stack. The lax-idempotent KZ apparatus of the [closure 2-monad](../morphisms/closure-2-monad.md) and the [temporal 2-category](../objects/temporal-2-category.md) — designed for regimes where 2-cells are non-trivial — does *not* introduce 2-cells into the moduli's automorphism structure. KZ-coherence 2-cells witness coherence of the closure operator's iteration (the settling-stage relation), not parallel comparison of automorphisms; the latter is what the moduli sees, and it is trivial.

## Sources of automorphisms

Under the naturality hypothesis ($\mathrm{Sym}(E)$-equivariance), the [predicate generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md) classification gives that natural bilattice endomorphisms of each $A_q$ factor through the four generator index maps — identity, swap $(s, o) \mapsto (o, s)$, subject-collapse, and object-collapse. Only identity and swap are invertible on the full $A_q$. Possible automorphism sources for $v$:

- **Bilattice-fiber gauge** — the [internal $\mathbb{Z}/2$-gauge](../concepts/internal-z2-gauge.md) from bilattice negation, acting cellwise on each fiber. Stabilizes $v$ iff every designated cell is $\bot$- or $\top$-valued or $\sim$-paired.
- **Fiber swap** — the involution $(s, o) \mapsto (o, s)$ uniformly across fibers. Stabilizes $v$ iff $v_\tau(q)(s, o) = v_\tau(q)(o, s)$ pointwise.
- **Entity permutation** — $\mathrm{Sym}(E)$-permutations preserving $v$ cellwise.
- **Predicate automorphism** — endofunctors of $\mathcal{C}$ preserving the four generator classes and stabilizing the settling.

Settling-shift autos with $\delta > 0$ are not invertible: $v_{\tau - \delta}$ is undefined for $\tau < \delta$. MLD-shifts exist as 1-cells *between distinct settlings* but not as self-automorphisms.
