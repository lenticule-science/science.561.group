---
title: research invariant
generated-by: certified-research-cell
generates: conserved research quantity
status: derived
session: 2026-06-23
---

# research invariant

A **research invariant** is a quantity preserved by certified research
composition.

## Definition

Let `theta : C => C` be a modal symmetry preserving the closure structure. For a
certified research cell `r : X -> C Y`, define:

```text
I_theta(r) := epsilon . theta_Y . r
```

where `epsilon` is the counit/readout from the closure.

## Proposition: certified composition preserves invariants

If `r` is certified and `s` is certified, then:

```text
I_theta(s o r) = I_theta(r)
```

for any modal symmetry `theta` that preserves the relevant closure laws.

## Proof

Certification says that both `r` and `s` factor through stable coalgebraic
structure. A modal symmetry preserving the closure laws commutes with the
structure used to compose certified cells. Therefore applying `theta` before
readout gives the same readout before and after certified continuation.

The invariant records what a research program can extend without changing.
