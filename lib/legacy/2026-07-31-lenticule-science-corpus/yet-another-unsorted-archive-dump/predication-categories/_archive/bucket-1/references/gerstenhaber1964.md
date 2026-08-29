---
type: reference
authors: [Gerstenhaber, Murray]
year: 1964
title: "On the Deformation of Rings and Algebras"
venue: "Annals of Mathematics 79(1), 59–103"
---

## Full citation

M. Gerstenhaber. "On the deformation of rings and algebras." *Annals of Mathematics* 79(1), 59–103, 1964.

## Status

Training-knowledge plus key construction verified. The cup-product-square obstruction theorem is standard textbook material reproducing Gerstenhaber's original argument; the corpus's [Ext-classification of SKH deformations](../theorems/skh-deformation-ext-classification.md) uses the same structural setup transposed to Q-enriched sheaves on the bitopological settling site.

## Annotation

The foundational paper of modern algebraic deformation theory. For an associative $k$-algebra $A$, Gerstenhaber:

1. **Classifies first-order deformations.** A first-order deformation of $A$ is an associative $k[\epsilon]/\epsilon^2$-algebra structure on $A \otimes_k k[\epsilon]/\epsilon^2$ extending the original $A$-structure. Such structures are classified by 2-cocycles $\phi \in C^2(A, A)$ in the **Hochschild cochain complex**, modulo coboundaries — i.e., by classes in $HH^2(A, A)$.

2. **Identifies obstructions.** A first-order deformation $A_\epsilon$ extends to a second-order deformation $A_{\epsilon^2}$ iff the **cup-product square** $\phi \cup \phi \in HH^3(A, A)$ vanishes (here $\cup$ is the Hochschild cup product, equivalently the bracket of Gerstenhaber's later 1963 paper). The cup-product-square is the *obstruction class*. When it vanishes, the deformation extends; when it does not, the deformation is obstructed at second order.

3. **Iterates to higher order.** Each $n$-th order extension has an obstruction class in $HH^3$ given by an explicit cup-product-style formula in the lower-order data; vanishing of all higher obstructions gives a formal deformation.

The corpus's [Ext-classification of SKH deformations](../theorems/skh-deformation-ext-classification.md) is the structural analog at one categorical level higher: deformations of cellular Q-enriched sheaves classified by $\mathrm{Ext}^1$ with obstructions in $\mathrm{Ext}^2$, the cup-product square computed in the bitopological-site sheaf cohomology rather than Hochschild. The [openness-boundary deformation dichotomy theorem](../theorems/openness-boundary-deformation-dichotomy.md) (sketch) identifies the openness-defect class $\delta$ as the cup-product-square in this setting, with the new structural content being the cosimplicial encoding of the meet-preservation discrepancy as the explicit 2-cocycle representing $\delta$.

For the program: Gerstenhaber 1964 is the structural prototype. The corpus's obstruction theory is *literally* Gerstenhaber's, transposed from associative algebras to Q-enriched sheaves with d-frame value category, with the openness-defect direction adding the new content (frame-theoretic obstructions, bilattice trichotomy $\delta = \delta^+ + \delta^- + \delta^\top$) on top of the structural template.

## Where used

- [SKH deformation Ext-classification](../theorems/skh-deformation-ext-classification.md)
- [Openness-boundary deformation dichotomy](../theorems/openness-boundary-deformation-dichotomy.md)
- [Openness-defect deformation theory question](questions/openness-defect-deformation-theory.md)
- [Openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md)
