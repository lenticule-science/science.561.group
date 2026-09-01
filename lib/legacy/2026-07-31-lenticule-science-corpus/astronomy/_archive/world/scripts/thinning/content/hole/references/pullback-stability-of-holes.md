---
type: theorem
class: stability
status: proved
depends-on: [hole]
see-also: [wood-between-worlds]
---

# Pullback stability of holes

**Statement.** Let $j : U \hookrightarrow H$ be a [hole](../teaching/explanations/hole.md) in the ambient relational category $\mathsf{R}$, and let $f : H' \to H$ be any morphism. Then the pullback

$$U' = H' \times_H U \to H'$$

is also a hole.

## Argument

Two things to check, one for each defining condition of a hole:

1. **(H1) Structural degeneration is preserved.** $\mathrm{QC}(U')$ is the pullback of $\mathrm{QC}(U)$ along the projection $U' \to U$. The QC-structure cannot *gain* symmetry under pullback — pullback can identify points but cannot introduce new symmetries — so $\mathrm{QC}(U')$ is no more symmetric than $\mathrm{QC}(U)$, which is by hypothesis strictly less symmetric than $\mathrm{QC}(H)|_U$. Composing, $\mathrm{QC}(U')$ is strictly less symmetric than $\mathrm{QC}(H')|_{U'}$.

2. **(H2) Boundary factorization is preserved.** Boundaries are stable under pullback in the ambient $\mathsf{R}$ (by the assumed finite-limits structure of $\mathsf{R}$): the boundary $\partial U'$ is the pullback of $\partial U$ along the projection. Any morphism $g' : U' \to X$ lifts to a morphism $U \to X$ along the projection (after restriction) which factors through $\partial U$ by hypothesis; pulling that factorization back gives the required factorization $U' \to \partial U' \to X$. ∎

## What this theorem is doing

Pullback stability is the structural reason holes are well-behaved under change of host. Without it, a hole in $H$ would not in general remain a hole when viewed inside any other host $H'$ that maps into $H$ — and the [Wood Between the Worlds](../objects/wood-between-worlds.md) construction, which depends on pools-as-holes being stable under the ambient morphisms used in the universal-property factorizations, would not be well-typed.

## Status

Proved at the level of the source draft. Full rigour requires being explicit about the precise definition of $\mathrm{QC}$-structure-pullback in $\mathsf{R}$; the source draft and this translation both work at the structural-argument level.

## Provenance

Lemma 2.5 of [`wood-between-worlds.md`](../../../../../../../work/triage/engineering-archive/library/humanities/theories/philosophy/theories/relationality/triage/provenance/math-from-relationality-bucket/wood-between-worlds.md). The lemma also appears recapped inside [`concepts/hole.md`](../teaching/explanations/hole.md); this is its standalone theorems-directory entry for cross-referencing.
