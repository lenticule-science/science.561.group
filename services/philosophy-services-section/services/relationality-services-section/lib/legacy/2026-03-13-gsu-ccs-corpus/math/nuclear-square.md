---
id: nuclear-square
description: "Two nuclei on the same Heyting algebra, arranged along two axes of a square — the minimal structure from which a commutative nuclear square and nuclear quartet subalgebra can arise."
---

### Definition — Nuclear Square {#nuclear-square}

A **nuclear square** is a Heyting algebra $A$ together with two nuclei
$j_1 : A \to A$ and $j_2 : A \to A$ on the same carrier, arranged along two
axes $D_1$ and $D_2$ of a [square](square.md).

This is the minimal structure: two [nuclear dyads](nuclear-dyad.md) sharing the same free
pole $A$, with no relationship between their quiescent poles assumed.

#### The Four Positions {#nuclear-square-positions}

Any nuclear square $(A, j_1, j_2)$ determines four natural positions:

| | axis $D_2$ quiescent | axis $D_2$ free |
|---|---|---|
| **axis $D_1$ quiescent** | $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ | $\mathrm{Fix}(j_1)$ |
| **axis $D_1$ free** | $\mathrm{Fix}(j_2)$ | $A$ |

These four sets always exist. What varies by the relationship between $j_1$ and $j_2$
is whether they cohere into a well-structured algebraic system:

- $\mathrm{Fix}(j_1)$ and $\mathrm{Fix}(j_2)$ are always Heyting sub-algebras of $A$.
- $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ is always a sub-lattice, but without further
  conditions it need not carry a nucleus projection from $A$: there is no guarantee that
  a canonical map $A \to \mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$ exists.

#### When the Square Coheres {#nuclear-square-coherence}

The square coheres — meaning the four positions become the corners of a genuine
algebraic diagram with nucleus maps between them — precisely when the two nuclei
commute: $j_1 \circ j_2 = j_2 \circ j_1$. That condition defines a
[commutative nuclear square](commutative-nuclear-square.md), which produces a
[nuclear quartet subalgebra](nuclear-quartet-subalgebra.md).

Without commutativity, the composite $j_1 \circ j_2$ need not be a nucleus: it may fail
idempotence or meet-preservation. The corner $\mathrm{Fix}(j_1) \cap \mathrm{Fix}(j_2)$
exists as a set but lacks a canonical reflection from $A$.

#### Relationship to Nuclear Dyads {#nuclear-square-and-dyads}

A nuclear square is a pair of [nuclear dyads](nuclear-dyad.md) on the same carrier:

| Dyad | Nucleus | Free pole | Quiescent pole |
|---|---|---|---|
| $j_1$-dyad | $j_1$ | $A$ | $\mathrm{Fix}(j_1)$ |
| $j_2$-dyad | $j_2$ | $A$ | $\mathrm{Fix}(j_2)$ |

The nuclear square adds no structure beyond this pairing. It names the fact that two
nuclear dyads share a free pole. Whether their quiescent poles cohere further depends on
the commutativity condition.
