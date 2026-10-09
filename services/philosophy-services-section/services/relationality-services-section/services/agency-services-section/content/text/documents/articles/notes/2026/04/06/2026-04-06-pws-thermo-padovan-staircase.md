---
title: "Document the Padovan growth rate ρ, three-level lookback, and contrast with Fibonacci"
specialization: task
date-created: 2026-04-06
plan: pws-thermodynamics
also-serves: [fars-graph-lifecycle, incremental-graph-updates]
work-type: derivation
input: "triage: void-monoid/zeta.py + finite-relational-math.md Part 329 (Nuclear Quartet Presettlement Matrix)"
architecture-note: "This is OS-level knowledge, not just world-sim. The growth rates determine how much memory respond() needs at each depth of predication expansion. The indexed store works because per-entity respond() pays ρ^n (Padovan) not 3^n (Total)."
contributes-to-milestone: pws-thermodynamics-m1-partition-function-specified
description: The partition function analysis (zeta.py) proved that the old draft's Fibonacci assumption was wrong — the possibly-settled piece grows at Padovan rate ρ, not Fibonacci rate φ.
---

The partition function analysis (zeta.py) proved that the old draft's Fibonacci assumption was wrong — the possibly-settled piece grows at Padovan rate ρ, not Fibonacci rate φ. The correction factor is ln(ρ)/ln(φ) ≈ 0.584. This changes the critical temperature of the system and the memory budget for predication computing.
