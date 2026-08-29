---
title: Norm Regime
role: structure
derived_from: math/acts/discipline
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Discipline interpreted as a normative law over recognitions: which states are
allowed or forbidden. Combines the earned discipline act with filtering of the
recognition carrier.

## Definition
- Carrier: [Recognition Carrier](recognition.md) equipped with a
  discipline (from [Discipline](../acts/discipline.md)) that marks admissible
  vs forbidden recognitions; filters may further refine admissibility.
- Law: a predicate/closure operator on recognitions indicating compliance or
  violation.

## Invariants
- Closure: admissible recognitions are closed under earned flow/nucleus where
  discipline allows.
- Violation handling: forbidden recognitions map to bottom/contradiction.
- Monotone: strengthening discipline never adds admissible recognitions.

## Proof
- Derived from: [Discipline](../acts/discipline.md) which provides the
  normative structure.
- Uses: [Recognition Carrier](recognition.md) to host admissible/forbid
  markings.
- Shows that: discipline acts can be viewed as normative regimes over
  recognitions, supporting operators that detect or enforce compliance.
