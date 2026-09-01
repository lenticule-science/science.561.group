---
type: reference
authors: [Schlessinger, Michael]
year: 1968
title: "Functors of Artin Rings"
venue: "Transactions of the American Mathematical Society 130, 208–222"
---

## Full citation

M. Schlessinger. "Functors of Artin rings." *Transactions of the American Mathematical Society* 130, 208–222, 1968.

## Status

Training-knowledge plus standard formulation verified. The H1–H4 conditions and the hull / pro-representability dichotomy are textbook material reproducing Schlessinger's original framework; the modern DGLA reformulation in [@manetti2009] confirms the conditions structurally.

## Annotation

The foundational paper of pro-representability theory in deformation theory. For a covariant functor $F : \mathrm{Art}_k \to \mathrm{Set}$ from Artin local $k$-algebras with residue field $k$ to sets (with $F(k) = *$), Schlessinger introduced four conditions:

- **(H1)** $F$ takes the natural map on certain pullback diagrams of Artin rings to a surjection. (Semi-exactness for surjective small extensions.)
- **(H2)** $F$ takes the pullback $A' \times_A k[\epsilon]/\epsilon^2 \to F(A') \times_{F(A)} F(k[\epsilon]/\epsilon^2)$ to a bijection. (Mittag-Leffler-type condition for the universal first-order extension.)
- **(H3)** The tangent space $t_F := F(k[\epsilon]/\epsilon^2)$ is finite-dimensional over $k$.
- **(H4)** $F$ takes a sharper class of pullbacks to bijections — the technical condition distinguishing hulls (versal but non-canonical) from pro-representability (canonical universal).

**Main theorem (Schlessinger).** *$F$ has a hull (a versal deformation, classifying $F$ up to non-canonical isomorphism) iff H1, H2, H3 hold. $F$ is pro-representable (a canonical universal deformation exists, in $\mathrm{Pro}(\mathrm{Art}_k)$) iff H1, H2, H3, H4 all hold.*

For the program, the [openness-defect deformation theory question](questions/openness-defect-deformation-theory.md) sub-question 5 asks whether the deformation functor $\mathrm{Def}(\mathcal{F})$ for a cellular Q-enriched sheaf $\mathcal{F}$ on the bitopological settling site satisfies Schlessinger's conditions:

- **Inside the cellular class.** H1, H2 are routine from the Ext-classification setup. H3 follows from the [tangent-dimension theorem](../theorems/tangent-dimension-constructible-non-semicontinuous.md): the tangent dimension is constant on each regime substratum and finite within strict / Scott-continuous regimes (dimension 0), transfinite-bounded regime (dimension $|L_{\mathrm{ns}}|$), and bounded by $\omega_1$ in aperiodic. H4 is conjecturally satisfied within each regime stratum, giving pro-representability.

- **Across the openness boundary.** The corpus's prediction is that H4 *fails* at boundary points where the tangent-dimension function jumps non-semicontinuously per the [tangent-dimension theorem](../theorems/tangent-dimension-constructible-non-semicontinuous.md). The mechanism: the well-behavedness condition H4 requires the deformation functor to commute with pullbacks of small extensions; non-semicontinuity of the tangent dimension is precisely the failure of such commutation at boundary points. This would be a structurally explicit class of Schlessinger pro-representability failures — rare in classical literature, where most deformation problems have well-behaved tangent structure throughout the moduli.

The d-frame setting requires Schlessinger's conditions to be reformulated for d-frame-valued deformation functors $\mathrm{Def}^{\mathbb{D}} : \mathrm{Art}^{\mathbb{D}}_k \to \mathrm{Bilattice}$, where "Artin ring" should mean a complete local d-frame algebra with maximal ideal whose powers stabilize (an axiomatization the corpus has not yet developed). The bilattice-valued analog of H1-H4, with separate conditions for the truth-side and falsity-side parts and a coherence condition for the consistency relation, is corpus development work.

## Where used

- [Openness-defect deformation theory question](questions/openness-defect-deformation-theory.md)
- [Openness-boundary deformation dichotomy](../theorems/openness-boundary-deformation-dichotomy.md)
- [Openness-defect deformation literature](prose/teaching/explanations/openness-defect-deformation-literature.md)
