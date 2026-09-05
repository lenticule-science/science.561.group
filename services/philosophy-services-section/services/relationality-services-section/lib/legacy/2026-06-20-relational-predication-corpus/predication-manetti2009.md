---
type: reference
authors: [Manetti, Marco]
year: 2009
title: "Differential Graded Lie Algebras and Formal Deformation Theory"
venue: "Algebraic Geometry — Seattle 2005, Part 2, Proc. Sympos. Pure Math. 80, 785–810, AMS"
---

## Full citation

M. Manetti. "Differential graded Lie algebras and formal deformation theory." In *Algebraic Geometry — Seattle 2005, Part 2*, Proceedings of Symposia in Pure Mathematics 80, 785–810, American Mathematical Society, 2009.

## Status

Training-knowledge plus standard formulation verified. The DGLA-to-deformation-functor correspondence is textbook material in modern deformation-theory exposition (see also [@hinich2001] for the DG-coalgebra dual viewpoint).

## Annotation

The modern (post-Deligne, post-Drinfeld) viewpoint on formal deformation theory: every reasonable deformation problem is controlled by a **differential graded Lie algebra** (DGLA) $L^\bullet$, with deformations corresponding to **Maurer-Cartan elements** $x \in L^1$ satisfying

$$dx + \tfrac{1}{2}[x, x] = 0$$

modulo gauge equivalence (action of $\exp(L^0)$).

Manetti's article surveys the framework:

- **The deformation functor associated to a DGLA.** $\mathrm{Def}_L : \mathrm{Art}_k \to \mathrm{Set}$ takes an Artin ring $A$ to equivalence classes of Maurer-Cartan elements of $L \otimes \mathfrak{m}_A$, where $\mathfrak{m}_A$ is the maximal ideal.

- **Schlessinger conditions automatic.** $\mathrm{Def}_L$ satisfies [@schlessinger1968]'s H1, H2 automatically. The tangent space is $H^1(L)$; obstructions live in $H^2(L)$.

- **Obstruction = bracket-square.** The cup-product-square obstruction reduces to the Lie bracket: the obstruction to extending a first-order MC element $x \in L^1$ to second order is the class $[x, x] \in L^2 \to H^2(L)$. This is the Gerstenhaber cup-product-square ([@gerstenhaber1964]) recast in DGLA terms.

- **Deligne–Drinfeld principle.** Two DGLAs related by an $L_\infty$-quasi-isomorphism induce isomorphic deformation functors. The DGLA controlling a deformation problem is determined only up to $L_\infty$-quasi-isomorphism.

For the corpus's openness-defect direction, the natural DGLA controlling cellular-sheaf deformations is the cochain complex of the bitopological-site sheaf cohomology of the endomorphism sheaf $\mathcal{E}\!nd(\mathcal{F})$, equipped with its cup-product-bracket structure. The **openness-defect class** $\delta$ from the [openness-boundary deformation dichotomy theorem](../theorems/openness-boundary-deformation-dichotomy.md) is the bracket-square $[x, x]$ of the first-order MC element $x$ representing the deformation, in this DGLA. The cosimplicial-resolution construction sketched in that theorem is the explicit computation of the bracket-square in the bitopological-site setting.

The d-frame extension — bilattice-DGLA controlling d-frame-valued deformation functors — has no direct precedent. Manetti's framework axiomatizes the DGLA-to-deformation-functor correspondence in classical (field-valued, Ab-valued) generality; extending it to bilattice-valued / d-frame-valued setting requires defining a bilattice DGLA structure (an object with truth-side, falsity-side, and consistency-relation graded Lie components, each independently differential and bracketed) and verifying the Maurer-Cartan / gauge-equivalence framework descends. This is the natural DGLA-side counterpart to the bilattice trichotomy $\delta = \delta^+ + \delta^- + \delta^\top$ predicted by the dichotomy theorem.

## Where used

- [Openness-defect deformation theory question](questions/openness-defect-deformation-theory.md)
- [Openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md)
