---

name: relational-hyperverse
description: "Object: The Relational Hyperverse"
defines: RelationalHyperverse
---

## Definition — The Relational Hyperverse {#relational-hyperverse}

The **Relational Hyperverse** $\mathcal{H}$ is the least fixed point of the
Universe Closure operator acting on the internal algebra of the Relational
Universe $R$.

More precisely: the Relational Universe $R$ carries an internal algebra
structure — the history category and fiber data visible from within $R$'s
internal logic rather than from outside it. Applying the nuclear quartet construction
(§history-and-fiber-algebra → §modal-calculus → §sheaf-construction → §closure-and-self-generation) to this internal algebra
produces a new relational universe one level richer than $R$. Iterating this
construction produces a tower

$$R \hookrightarrow R^{(1)} \hookrightarrow R^{(2)} \hookrightarrow \cdots$$

where each $R^{(n)}$ is a relational universe with $R^{(n-1)}$ as its
algebra-level input. The **Relational Hyperverse** is the colimit of this tower:

$$\mathcal{H} = \varinjlim_n R^{(n)}.$$

It satisfies the fixed-point equation

$$\mathcal{H} = U_{\mathcal{H}}(\mathcal{H}),$$

where $U_{\mathcal{H}}$ is the Universe Closure operator at the meta-level:
the same operator as $U_G$ (§closure-operator), but applied to the
internal algebra of $R$ rather than to primitive history data.

$\mathcal{H}$ is to the construction cycle what $R$ is to one turn
construction (§self-generation): the object for which the program has
no more work to do. The cycle applied to $\mathcal{H}$ returns $\mathcal{H}$.

### Definition — The Relational Hyperverse {#relational-hyperverse}

This definition names $\mathcal{H}$ and states its characterizing
fixed-point equation. The construction — verifying that the tower exists,
that its colimit satisfies all the axioms of a relational universe at the
meta-level, and that $U_{\mathcal{H}}(\mathcal{H}) = \mathcal{H}$ — belongs
to the spiral layer of the program and is not carried out here.

The parallel with $R$ is exact: in §sheaf-construction and §closure-and-self-generation we first defined
$R$, then proved it existed, then proved $R = U_G(R)$. The same three steps
apply to $\mathcal{H}$, one level up.

### Remark — Self-Similarity

The nuclear quartet structure applies to $\mathcal{H}$ itself. Its four aspects are:

- **Algebra**: the Relational Universe $R$ — the history category and fiber
  algebras that serve as $\mathcal{H}$'s algebra-level input
- **Language**: the internal theorems of $R$ — the axioms of the
  constructive layer, proved from inside $R$'s logic (§tetrads-levels)
- **Geometry**: the space of relational universes — morphisms between
  relational universes, the moduli space $\mathcal{M}_n$, the site whose
  sheaves are $\mathcal{H}$'s objects (§tetrads-levels)
- **Dynamics**: $U_{\mathcal{H}}$ acting on $\mathcal{H}$ — this definition,
  the tower, and the fixed-point theorem (§tetrads-levels)

The program studying relational universes is itself a relational universe.
