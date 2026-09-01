---

name: square
description: "A square is the product of two dyads: a 2×2 structure whose four positions are all combinations of the poles of the two constituent dyads. All squares are made of dyads — that is what makes them squares."
---

### Definition — Square {#square}

A **square** is the product of two dyads $D_1 = (A, B)$ and $D_2 = (C, D)$:

| | $C$ | $D$ |
|-|-----|-----|
| $A$ | $(A, C)$ | $(A, D)$ |
| $B$ | $(B, C)$ | $(B, D)$ |

The four positions are not independent: they inherit the relational structure of both dyads. Moving along $D_1$ (from the $A$-row to the $B$-row) applies one binary distinction; moving along $D_2$ applies another. A square is the minimal structure that encodes two independent binary distinctions simultaneously.

All squares are made of dyads. This is not a restriction — it is the definition. A four-element structure that is not the product of two dyads is a tetrad; a four-element structure that IS the product of two dyads is a square.

#### Squares and Tetrads {#square-vs-tetrad}

A **tetrad** names four elements. A **square** is a tetrad in which the four elements are organized as a $2 \times 2$ grid — a product of two dyads. Not every tetrad is a square: a tetrad is a square only when its four elements fall into two intersecting dyads with no algebraic relationships between the positions required.

When a square carries additional algebraic structure — nuclei, adjunctions, or other morphisms — relating the four corners, it becomes a named mathematical object in its own right. The primary named square in $R$ is the **nuclear square** ([CommutativeNuclearSquare](commutative-nuclear-square.md)): a Heyting algebra $A$ equipped with two commuting nuclei $j_1, j_2$, with the four corners occupied by $A$, $\mathrm{Fix}(j_1)$, $\mathrm{Fix}(j_2)$, and $A^* = \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$.

The constituent dyads of the nuclear square are:

- The $j_1$-nuclear dyad $(A, \mathrm{Fix}(j_1))$ along one axis.
- The $j_2$-nuclear dyad $(A, \mathrm{Fix}(j_2))$ along the other axis.

The four sub-algebras that occupy the corners of the nuclear square form the **nuclear quartet** ([NuclearQuartetSubalgebra](nuclear-quartet-subalgebra.md)). The nuclear square is the structure; the nuclear quartet is the four-element content of that structure.
