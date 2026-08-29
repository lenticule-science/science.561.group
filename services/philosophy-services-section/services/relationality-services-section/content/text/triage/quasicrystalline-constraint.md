---
title: Quasicrystalline Constraint
id: quasicrystalline-constraint
role: structure
status: plan
derived_from:
- math/structure/hypertensor-sheaf
proof_refs: []
---


# Quasicrystalline Constraint

Local rules/aperiodicity constraints imposed on hypertensor sections to earn
the quasicrystalline qualifier.

## Definition
- Carrier: predicates on [Hypertensor Section](hypertensor-section.md) over
  [Hypertensor Window](hypertensor-window.md) enforcing local matching rules
  and forbidding periodicity.

## Invariants
- Local: rules depend only on finite windows; stable under restriction.
- Aperiodic: no nontrivial translations leave sections invariant (as earned
  when acts supply aperiodicity).

## Proof
- Derived from: [Hypertensor Sheaf](hypertensor-sheaf.md) with additional local
  rule constraints.
- Shows that: sections satisfying these constraints form the
  quasicrystalline subclass.
