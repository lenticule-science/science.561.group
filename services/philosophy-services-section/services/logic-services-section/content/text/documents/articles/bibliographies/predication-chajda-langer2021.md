---
type: reference
authors: [Chajda, Ivan, Länger, Helmut]
year: 2021
title: "Adjoint Operations in Twist-Products of Lattices"
venue: "Symmetry 13(2), Article 253; arXiv:2101.00677"
description: I.
---

## Full citation

I. Chajda, H. Länger. "Adjoint Operations in Twist-Products of Lattices." *Symmetry* 13(2), Article 253, 2021. arXiv:2101.00677. 18 pp. Open access.

## Status

Read locally; no PDF currently in `sources/`, but open-access on arXiv. The cleanest modern presentation of the Busaniche–Cignoli twist-product residuation.

## Annotation

The residuation theorem this paper proves is the central algebraic fact our program rests on.

**Theorem 2.3.** On the twist product $\mathbf{L}^\bowtie$ of any integral commutative residuated lattice $\mathbf{L}$, the operations

$$(x, y) \odot (z, v) = (x \cdot z,\ (x \to v) \wedge (z \to y))$$
$$(x, y) \Rightarrow (z, v) = ((x \to z) \wedge (v \to y),\ x \cdot v)$$

form a residuated pair with respect to the truth order $\leq_t$. The proof is a direct 7-step chain of equivalences applying the residuation axiom of $\mathbf{L}$ at each step.

The foundational layer adopts this proof more or less verbatim as Theorem 4.1.

**§5** introduces an alternative pair using $(y' \cdot v')'$ in the second component, valid when $\mathbf{L}$ is bounded and double-negation holds. This makes the resulting residuated lattice integral. The foundational layer explicitly does **not** adopt this alternative; we keep the Busaniche–Cignoli pair (4.1)–(4.2).

Notation in the source: $\sqcup, \sqcap$ for the twist-product lattice operations; $\odot, \Rightarrow$ for the residuation pair.
