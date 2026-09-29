---
title: K4/FOUR analytic spine
date: 2026-07-01
status: "proved finite bridge with frontier boundary"
tags: [k4, four, chromatic, rayleigh, diffraction, quasicrystal, frontier]
---

The K4/FOUR chromatic material now has a finite analytic spine.

Green Lean carriers:

- `Infomaterial.Combinatorics.K4_requires_FOUR`: every proper coloring of
  `completeGraph Charge` is injective.
- `Infomaterial.Combinatorics.properK4Colourings_count`: the concrete list of
  proper FOUR-colorings of K4 has length `24`.
- `Infomaterial.Flow.K4FourAnalyticSpine` and
  `Infomaterial.Flow.k4_four_analytic_spine`: the K4 action, exact
  king-adjacency FOUR obstruction, K4 coloring count, Rayleigh floor, small
  finite gap witnesses, quadratic/cubic gap certificates, and finite
  Fourier-side phase/mass readout are bundled as one finite claim-site.
- `Infomaterial.Relational.Material.Glass.Quasicrystals.BeadPhaseSpine` and
  `Infomaterial.Relational.Material.Glass.Quasicrystals.bead_phase_k4_analytic_spine`:
  a quasicrystal bead phase carries the finite bead spine together with the
  K4/FOUR analytic spine over its finite occupation pattern.

What this earns for crystals and quasicrystals:

- the bead phase is a finite carrier between tile and crystal;
- the quasicrystal layer retains bead legality, held contradiction, lenticle
  overlap, load-bearing placement, and finite diffraction mass;
- the same finite occupation pattern can now be read through the K4/FOUR
  analytic spine.

What remains frontier:

- the general `N`-site path spectral formula needs the real infimum and cosine
  eigenbasis carrier;
- the `N=7` gap still has a cubic bracket, not a constructed Bishop-real root;
- infinite-volume diffraction needs translation-bounded measures, Fourier
  transforms, and an analytic Lebesgue decomposition;
- continuum crystal/quasicrystal claims need a limit carrier beyond the current
  finite occupation and finite diffraction mass.

This is the current stopping boundary: the finite theorem is green; the next
analytic promotion needs new real/spectral/diffraction carriers rather than
more prose over the existing finite statements.
