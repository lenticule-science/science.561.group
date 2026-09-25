---
type: bibliography
key: chalupa-leath-reich1979
reference-type: article
authors:
- J. Chalupa
- P. L. Leath
- G. R. Reich
year: 1979
title: 'Bootstrap percolation on a Bethe lattice'
journal: 'Journal of Physics C: Solid State Physics'
volume: '12'
number: '1'
pages: 'L31-L35'
description: "Journal of Physics C: Solid State Physics 12(1), 1979, pp."
---

# Chalupa, Leath & Reich 1979 — Bootstrap percolation on a Bethe lattice

*Journal of Physics C: Solid State Physics* 12(1), 1979, pp. L31–L35.

## Why this is central

Introduces **bootstrap percolation**: seed a random subset of lattice sites active, then
repeatedly activate any site with at least a threshold number `r` of already-active
neighbors, until no further site can activate. This is the paper this section's
measurement instantiates directly as its `bootstrap2` model (threshold `r = 2` on a 2D
torus). Bootstrap percolation is not itself a glass model — it seeds activity rather than
blockage and its facilitation rule cannot leave a genuinely frozen residual once activated
sites stay active — but it is the purely combinatorial ancestor of the same
closure-under-a-neighbor-rule mechanism the Spiral Model uses to produce jamming, and its
independently proven sharp threshold (Holroyd 2003) makes it a useful control case for
this section's deterministic facilitation-closure instrument.

## What it does not settle

The original paper's threshold results are for the Bethe lattice (an infinite regular tree,
mean-field in character); the sharp threshold for the finite two-dimensional square lattice
this section's measurement actually uses is a separate, later result (Holroyd 2003).

## Bridges

- To [the note on the glass transition as a settling regime change](../notes/2026/09/04/2026-09-04-note-on-the-glass-transition-as-a-settling-regime-change.md)
  — §1 introduces bootstrap percolation from this paper; §3 reads this section's
  `bootstrap2` measurement against it and against Holroyd's 2D threshold.
