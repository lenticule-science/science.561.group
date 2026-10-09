---
title: "Extract and document the Padovan correction to the partition function"
specialization: task
date-created: 2026-04-06
plan: pws-math-mining
also-serves: [fars-graph-lifecycle, incremental-graph-updates, respond-algebra-correction]
work-type: derivation
input: "triage: void-monoid/zeta.py + finite-relational-math.md Part 329-330"
architecture-note: "The four growth rates (3, 2, ρ, poly) are FARS's computational cost model. Every respond() at depth n costs ρ^n for the possibly-settled piece. The indexed store works because it keeps depth shallow."
contributes-to-milestone: pws-math-mining-m2-core-structures-extracted
description: The old partition function Z(q) = (1+q²)/(1-q-q²)² assumed F=∅.
---

The old partition function Z(q) = (1+q²)/(1-q-q²)² assumed F=∅. zeta.py showed F≠∅, changing the characteristic polynomial from quadratic (Fibonacci) to cubic (Padovan). Poles at roots of 1-z²-z³=0, not 1-z-z²=0. First real pole at z=1/ρ, not z=1/φ. Correction factor ln(ρ)/ln(φ) ≈ 0.584.
