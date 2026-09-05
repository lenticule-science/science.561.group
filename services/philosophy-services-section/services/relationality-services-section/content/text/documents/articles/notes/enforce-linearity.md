---
title: Enforce Linearity
id: enforce-linearity
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Enforces linear/affine resource constraints during flow/interleaving.

## Definition
- Inputs: a [Linearity Constraint](./linearity-constraint.md) and
  flow steps to be executed.
- Output: updated constraint witness ensuring no duplication/discard violations.
- Behaviour: check each flow step; reject or mark violations if linear resources
  are copied/discarded improperly.

## Invariants
- Soundness: all accepted flows respect linearity.
- Compositional: constraints update coherently across interleavings.

## Proof
- Uses: linearity annotations and flow steps.
- Produces: constraint witness or failure.
- Shows that: linearity can be enforced in concurrent flows.
