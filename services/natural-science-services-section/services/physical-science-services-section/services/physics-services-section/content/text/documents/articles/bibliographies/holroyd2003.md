---
type: bibliography
key: holroyd2003
reference-type: article
authors:
- Alexander E. Holroyd
year: 2003
title: 'Sharp metastability threshold for two-dimensional bootstrap percolation'
journal: Probability Theory and Related Fields
volume: '125'
number: '2'
pages: '195-224'
description: Probability Theory and Related Fields 125(2), 2003, pp.
---

# Holroyd 2003 — Sharp metastability threshold for two-dimensional bootstrap percolation

*Probability Theory and Related Fields* 125(2), 2003, pp. 195–224.

## Why this is central

Proves the sharp finite-size threshold for two-dimensional threshold-2 bootstrap
percolation on an `L × L` grid: `p_c(L) ~ π² / (18 ln L)`, the density above which the
whole lattice activates with probability tending to 1 as `L → ∞`. The convergence is
logarithmically slow in `L`, meaning finite-size simulations at practically reachable
lattice sizes systematically read a lower apparent threshold than the true asymptotic
constant predicts — the fact this section's note uses to explain its own `bootstrap2`
measurement's empirically observed crossing (between `p = 0.04` and `p = 0.06` at
`L = 256`) sitting well below `p_c(256) ≈ 0.099`.

## What it does not settle

The theorem is specific to the square lattice, threshold 2, in two dimensions; it does not
directly give thresholds for other lattices, other thresholds `r`, or other dimensions
(though the general asymptotic scaling form has since been extended by others). It also
does not itself model any glassy dynamics — bootstrap percolation's own literature keeps it
a separate combinatorial object from the KCM family, related by mechanism, not identity.

## Bridges

- To [the note on the glass transition as a settling regime change](../notes/2026/09/04/2026-09-04-note-on-the-glass-transition-as-a-settling-regime-change.md)
  — §3 reads this section's `bootstrap2` crossing against this paper's asymptotic
  threshold and its slow finite-size convergence.
