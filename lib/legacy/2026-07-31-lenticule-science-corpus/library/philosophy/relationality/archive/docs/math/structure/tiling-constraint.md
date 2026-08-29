---
title: Tiling Constraint
id: tiling-constraint
role: structure
status: plan
proof_refs: []
---


# Tiling Constraint

Constraints on allowable hypertensor windows from aperiodic tiling/substitution
acts.

## Definition
- Rules: local substitution/tiling rules on [Hypertensor Window](hypertensor-window.md)
  specifying admissible configurations.
- Aperiodicity: rules exclude periodic tilings when required.

## Invariants
- Local rule completeness: every global section must satisfy all local rules.
- Stability: constraints stable under refinement and window overlaps.

## Proof
- Uses: tiling/substitution acts to define admissible windows.
- Shows that: windows obey earned local rules for quasicrystalline structure.
