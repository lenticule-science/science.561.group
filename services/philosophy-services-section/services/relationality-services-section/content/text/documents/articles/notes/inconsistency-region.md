---
title: Inconsistency Region
id: inconsistency-region
role: structure
status: plan
proof_refs: []
---


# Inconsistency Region

Collects recognitions that cannot be jointly realised in any profile—regions of
contradiction.

## Definition
- Carrier: set of recognitions whose joint flow leads to bottom/contradiction in
  the [Recognition Carrier](./recognition.md).
- Computation: explore flow combinations; mark those that collapse.

## Invariants
- Closure: closed under flow/nucleus toward bottom.
- Detection: presence indicates degeneracy/chaos in traces.

## Proof
- Uses: recognition lattice and flow to detect collapse to bottom.
- Shows that: inconsistent recognitions can be isolated as a carrier.
