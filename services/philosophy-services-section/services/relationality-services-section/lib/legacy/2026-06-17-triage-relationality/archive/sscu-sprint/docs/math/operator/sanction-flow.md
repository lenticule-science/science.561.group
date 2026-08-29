---
title: Sanction Flow
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Flows contexts under a norm regime, suppressing or redirecting recognitions that
violate the regime.

## Definition
- Inputs: a [Norm Regime](../structure/norm-regime.md), a [Context](../structure/context.md),
  and the earned [Flow Context](flow-context.md) operator.
- Output: transformed [Context](../structure/context.md) with norm-violating
  recognitions mapped to bottom or redirected per the discipline.
- Behaviour: compose context flow with the norm predicate; filter or rewrite
  recognitions that fail the regime before continuing evaluation.

## Invariants
- Soundness: compliant recognitions are preserved; violators are suppressed or
  redirected consistently.
- Monotonicity: strengthening the regime makes the flow at least as restrictive.
- Compatibility: commutes with earned nucleus/flow laws on contexts.

## Proof
- Uses: [Norm Regime](../structure/norm-regime.md) to decide admissibility and
  [Flow Context](flow-context.md) to transport contexts.
- Produces: filtered [Context](../structure/context.md).
- Shows that: normative policies can be enforced as part of context flow
  without breaking earned flow/nucleus structure.
