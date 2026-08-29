---
id: tower-fiber-seeding
name: TowerFiberSeeding
description: "Tower Fiber Seeding"
---

### Theorem — Tower Fiber Seeding {#tower-fiber-seeding}

Let $n \geq 0$ and $\mathbf{U} \in \mathrm{Ob}(\mathbf{RU}^{(n)})$ be a relational
universe at level $n$. The fiber of $R^{(n+1)} = \mathbf{Sh}(\mathbf{RU}^{(n)}, J^{(n+1)})$
over $\mathbf{U}$ is the fixed fiber of $\mathbf{U}$ at level $n$:
$$
\bigl(R^{(n+1)}\bigr)_\mathbf{U} \;=\; H_\mathbf{U}^{(n)*}
\;=\; \mathrm{Fix}(\sigma_\mathbf{U}^{(n)}) \cap \mathrm{Fix}(\Delta_\mathbf{U}^{(n)}).
$$

In particular, the joint fixed-point sub-algebra of the nuclear square at level $n$
is the free carrier fiber at level $n+1$: the doubly stable propositions about
$\mathbf{U}$ within $R^{(n)}$ are exactly the raw propositions about $\mathbf{U}$
within $R^{(n+1)}$.

#### Proof Sketch {#tower-fiber-seeding-proof}

By the construction of the hyperverse tower (§tower-level-1, §hyperverse-tower),
the fiber algebras of $R^{(n+1)}$ over an object $\mathbf{U} \in \mathbf{RU}^{(n)}$
are defined to be the Heyting algebras of stable propositions about $\mathbf{U}$ at
level $n$ — specifically, the propositions in $\mathbf{U}$ that are fixed by both
the saturation nucleus $\sigma_\mathbf{U}^{(n)}$ and the transfer nucleus
$\Delta_\mathbf{U}^{(n)}$ induced by the embedding
$\mathbf{U} \hookrightarrow R^{(n+1)}$.

By definition of the fixed fiber (§fixed-fiber), this is precisely
$H_\mathbf{U}^{(n)*}$. $\square$

#### Significance {#tower-fiber-seeding-significance}

This theorem identifies the fiber nuclear quartet at each level as the unit of
tower propagation. The fiber nuclear quartet (§fiber-nuclear-quartet) at level $n$
over $\mathbf{U}$ is the nuclear square
$(H_\mathbf{U}^{(n)},\, \sigma_\mathbf{U}^{(n)},\, \Delta_\mathbf{U}^{(n)})$
with its four sub-algebras. Tower Fiber Seeding states that the joint fixed-point
sub-algebra $H_\mathbf{U}^{(n)*}$ — the smallest of the four — is exactly the free
carrier $H_\mathbf{U}^{(n+1)}$ at the next level.

The tower therefore does not carry forward all four sub-algebras: it carries forward
only the joint fixed point, which then acquires a new nuclear square structure
$(H_\mathbf{U}^{(n+1)},\, \sigma_\mathbf{U}^{(n+1)},\, \Delta_\mathbf{U}^{(n+1)})$
at the next level — a new fiber nuclear quartet with its own four sub-algebras, none
of which (except possibly $H_\mathbf{U}^{(n+1)*}$) are the same as those at level $n$.
