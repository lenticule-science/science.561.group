---
title: Quasicrystalline Constraint
role: structure
derived_from:
- math/structure/hypertensor-sheaf
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Local rules/aperiodicity constraints imposed on hypertensor sections to earn
the quasicrystalline qualifier.

## Definition
- Carrier: predicates on [Hypertensor Section](hypertensor-section.md) over
  [Hypertensor Window](hypertensor-window.md) enforcing local matching rules
  and forbidding periodicity.

## Invariants
- Local: rules depend only on finite windows; active under restriction.
- Aperiodic: no nontrivial translations leave sections invariant (as earned
  when acts supply aperiodicity).

## Proof
- Derived from: [Hypertensor Sheaf](hypertensor-sheaf.md) with additional local
  rule constraints.
- Shows that: sections satisfying these constraints form the
  quasicrystalline subclass.
