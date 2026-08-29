---
title: Settling Cohomology
description: The sheaf cohomology of the settling-associated sheaf — H⁰ is the global settled section (a count of designated cells), H¹ the obstruction to gluing local sections into one global section. H¹ drains to zero exactly as the cascade settles (it vanishes in the finite/strict and Scott-continuous regimes), so cohomology is the precise measure of how far a trace is from a coherent fixed point. Sibling to the section: section is H⁰ realized, cohomology is the obstruction theory around it.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["settling-cohomology", "sheaf-cohomology", "cech-cohomology", "h0", "h1", "gluing-obstruction", "vanishing", "bigraded-cohomology", "crdt-convergence", "calm", "regime"]
---

# Settling Cohomology

## What this node is

**Settling cohomology** is the sheaf cohomology $H^n(\mathbf{T}^*, \mathcal{F})$
of the settling-associated [sheaf](../../sheaf.md) — the derived-functor /
Čech invariant of the very sheaf whose global [section](../section/section.md) a
settling produces. It is sited here, beneath the sheaf and beside the section,
because that is where its `local` proposition is honest: to be a settling
cohomology you must *be* the cohomology of a settling-associated sheaf
(`recognize_child = recognize_sheaf ∧ is-its-derived-functor-invariant`). It is
not a generic chapter of "sheaf cohomology" the academic field; it is the
obstruction theory of *this* sheaf.

- **$H^0$ is the global section realized** — a count of the designated, settled
  cells; the fixed point [settling](../../../../settling.md) reaches.
- **$H^1$ is the obstruction to gluing** — the disagreement among local sections
  that fails to assemble into one global section. It is the cohomological face of
  the cascade's residue.

So the [section](../section/section.md) is $H^0$ *realized*; settling cohomology
is the full obstruction theory around it, and the two are siblings under the sheaf
for exactly that reason.

## Vanishing is settling

The cascade ending — residue draining to zero — *is* $H^1 = 0$. In the finite /
strict regime all cohomological questions reduce to finite linear algebra,
$H^0$ is a count of designated cells and $H^1 = 0$; for Scott-continuous settlings
the settling-associated sheaf at the $\omega$-limit is the filtered colimit of
finite-stage sheaves, derived functors commute with the colimit (AB5), and
vanishing is recovered stage-by-stage. Settling cohomology *vanishes above degree
1* throughout, so every classification question stays in $H^0$ and $H^1$.

The non-Scott-continuous regimes (transfinite-bounded, aperiodic) are exactly the
ones where $H^1$ need not vanish: classification becomes a combinatorial question
about firing-ordinal sets up to settling-shift. Non-vanishing cohomology is the
signature of a trace that does **not** settle to a coherent global section.

## Refinements and connections

Because the [bilattice](../../../../../../pre-bilattice/content/bilattice/bilattice.md) carries two orders,
the single graded invariant refines to a **bigraded settling cohomology**
$H^{m,n}_{k,t}$ on the bitopological settling site — one axis per order — related by
a truth–knowledge comparison long exact sequence (the [bigraded
diamond](../../../bigraded-diamond/bigraded-diamond.md)'s two nuclei, seen
cohomologically). On the distributed-systems side, $H^1$ vanishing is CRDT
convergence / cohomological CALM: a delta is a Čech 1-cochain modulo coboundaries,
and vanishing $H^1$ is exactly the guarantee that deltas integrate without
coordination.

## Orientation

The sheaf whose cohomology this is sits one level up at [sheaf](../../sheaf.md);
its $H^0$ is the [section](../section/section.md); the morphism whose completion is
$H^1 = 0$ is [settling](../../../../settling.md). Its development corpus —
computation per regime, the bigraded refinement, the CRDT/CALM correspondences —
is collected in [`_archive`](_archive) for concept-by-concept promotion.
