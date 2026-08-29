---
title: Discover Carrier
id: discover-carrier
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Discover Carrier

Attempts to identify previously unknown or unregistered carriers present in a
sheaf section, surfacing them as recognitions or failures.

## Definition
- Inputs: recognition criteria for target carrier shapes/types, a
  [Quasicrystalline Hypertensor Sheaf Section](../structure/quasicrystalline-hypertensor-sheaf-section.md),
  ambient [Policy Regime](../structure/policy-regime.md), and the current
  [Trace Carrier](../structure/trace.md).
- Outputs: [Recognition Carrier](../structure/recognition.md) entries
  for discovered carriers or a [Failure Algebra](../structure/failure-algebra.md)
  element when discovery fails or is disallowed.
- Behaviour:
  1. Enumerate candidate subwindows/subsections from the section’s coverage site
     and policy-visible regions.
  2. For each candidate, apply earned recognition operators
     (e.g. [Recognize Observation](recognize-observation.md),
     [Recognize Context](recognize-context.md)) using the supplied criteria.
  3. If a candidate matches, emit a recognition carrier tagged with the trace
     span and policy witness; otherwise accumulate a failure witness
     (policy violation, shape mismatch, or unsupported carrier).
  4. Aggregate results as a recognition set plus failure diagnostics.

## Invariants
- Safe probing: no mutation of the section or trace; respects policy/trace
  constraints while enumerating candidates.
- Determinate: given the same section/policy/criteria, produces the same
  recognitions/failures up to nucleus equivalence.
- Explicit failure on unknown/unsupported carrier types.

## Proof
- Uses: recognition operators on the sheaf section, plus policy/trace carriers,
  to decide admissibility and shape matching.
- Shows that: systematic probing of admissible subwindows with earned
  recognition operators yields either recognition carriers for discovered
  shapes or failure witnesses when discovery is disallowed or unsupported.
