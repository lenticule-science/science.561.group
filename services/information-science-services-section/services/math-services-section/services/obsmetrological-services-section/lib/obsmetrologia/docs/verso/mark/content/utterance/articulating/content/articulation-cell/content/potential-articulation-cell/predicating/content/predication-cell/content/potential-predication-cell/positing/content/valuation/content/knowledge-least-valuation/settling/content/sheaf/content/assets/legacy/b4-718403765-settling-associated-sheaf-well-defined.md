---
type: theorem
status: proved
depends-on: [settling-associated-sheaf, kz-coherent-sheaf, bitopological-settling-site, settling-monotonicity]
---

# The settling-associated sheaf is a well-defined KZ-coherent sheaf

The [settling-associated sheaf](../objects/settling-associated-sheaf.md) $\mathcal{F}_U$ is a well-defined KZ-coherent sheaf on $(\mathbf{T}^*, J)$.

## Proof

**Functoriality.** Composition of morphisms $(f, h, j) \circ (f', h', j')$ in the [bitopological settling site](../objects/bitopological-settling-site.md) sends cells via composite reindexing; the induced $\mathbb{Z}$-linear map between free abelian groups is the composite, by naturality of the free-abelian-group functor.

**Sheaf condition.** For a pairwise-Stone cover $\{(q, \tau, U_i) \to (q, \tau, U)\}_{i \in I}$ with $\bigcup_i U_i = U$, the set of newly-added designated points decomposes as

$$\Delta^{+, *}_\tau(q) \cap U \;=\; \bigcup_i \bigl(\Delta^{+, *}_\tau(q) \cap U_i\bigr).$$

The Čech sheaf-condition sequence

$$0 \to \mathbb{Z}^{\Delta^{+, *}_\tau(q) \cap U} \to \prod_i \mathbb{Z}^{\Delta^{+, *}_\tau(q) \cap U_i} \rightrightarrows \prod_{i, j} \mathbb{Z}^{\Delta^{+, *}_\tau(q) \cap U_i \cap U_j}$$

is the direct sum (over the discrete set $\Delta^{+, *}_\tau(q) \cap U$) of the exact sequence for the constant $\mathbb{Z}$-sheaf on a discrete space, which is trivially exact. Hence $\mathcal{F}_U$ satisfies the sheaf condition.

**[KZ-coherence](../concepts/kz-coherent-sheaf.md).** The newly-added-at-$\tau$ set $\Delta^+_\tau(q)$ is determined by the primal settling's values at cells $(s, o)$, which are invariant under the KZ-coherence 2-cells of $\mathbf{T}^*$: those 2-cells witness equalities between different route-descriptions of the same settling stage, not changes in the settling itself. Hence $\mathcal{F}_U(f) = \mathcal{F}_U(f')$ whenever $f, f'$ differ by a KZ 2-cell. $\square$
