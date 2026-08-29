---
name: extending
description: The structure-extension morphism. Maps a richer structure to a less-refined structure whose signature it contains. The cell (X, extending, Y) asserts Sig(Y) ⊆ Sig(X) and every X-instance is, on forgetting X's extra structure, a Y-instance.
gerund: extending
agent-noun: extender
domain: structure
codomain: structure
references:
  - id: birkhoff1935
    type: article-journal
    title: On the structure of abstract algebras
    volume: 31
    issue: 4
    author:
      - literal: Birkhoff, Garrett
    container-title: Proceedings of the Cambridge Philosophical Society
    page: 433-454
    issued:
      - year: 1935
  - id: burris-sankappanavar1981
    type: book
    title: A Course in Universal Algebra
    publisher: Springer
    location: New York
    series: Graduate Texts in Mathematics
    volume: 78
    author:
      - literal: Burris, Stanley
      - literal: Sankappanavar, H. P.
    issued:
      - year: 1981
  - id: ginsberg1988
    type: article-journal
    title: Multivalued logics: A uniform approach to inference in artificial intelligence
    volume: 4
    issue: 3
    author:
      - literal: Ginsberg, Matthew L.
    container-title: Computational Intelligence
    page: 265-316
    issued:
      - year: 1988
---

A morphism from a structure $X$ to a structure $Y$ such that $X$'s signature contains $Y$'s.

## Proof of well-formedness

In universal algebra (Birkhoff 1935 *On the structure of abstract algebras*; Burris & Sankappanavar 1981 *A Course in Universal Algebra* ch. I), a structure $X$ is given by a signature $\mathrm{Sig}(X) = (F_X, R_X)$ — a set $F_X$ of function symbols (each with an arity) and a set $R_X$ of axioms — together with a carrier and interpretations.

$X$ **extends** $Y$ iff $F_Y \subseteq F_X$, $R_Y \subseteq R_X$ (axiom set inclusion at common arity), and the forgetful map $U_{X \to Y}$ that drops $F_X \setminus F_Y$ from an $X$-instance produces a $Y$-instance. Equivalently: every $X$-model is a $Y$-model on the smaller signature.

For the bilattice tower:

- Pre-bilattice has $F = \{\wedge_t, \vee_t, \wedge_k, \vee_k\}$, $R = $ two-lattices axioms (Ginsberg 1988 §2).
- Bilattice has $F = F_{\text{pre-bilattice}} \cup \{\sim\}$, $R = R_{\text{pre-bilattice}} \cup \{\sim\sim a = a,\; a \leq_t b \Rightarrow \sim b \leq_t \sim a,\; a \leq_k b \Rightarrow \sim a \leq_k \sim b\}$.

The cell $(\text{bilattice}, \text{extending}, \text{pre-bilattice})$ is well-formed: $F_{\text{pre-bilattice}} \subseteq F_{\text{bilattice}}$ and the forgetful map dropping $\sim$ from a bilattice produces a pre-bilattice.

The extension relation is reflexive, antisymmetric, transitive — a partial order on structure-records.
