---
title: Evaluate Section Step
id: evaluate-section-step
role: operator
status: plan
inputs:
- id: hypertensor-section
  alias: section
- id: evaluation-context-stack
  alias: stack
outputs:
- id: hypertensor-section
  alias: next-section
- id: evaluation-context-stack
  alias: next-stack
transformation:
- let
  - frame
    - call
      - top-frame
      - stack
  - reduced
    - call
      - apply-frame
      - frame
      - section
  - next-stack
    - call
      - update-stack
      - stack
      - reduced
  - return
    - reduced
    - next-stack
proof_refs:
- hypertensor-section
- evaluation-context-stack
- top-frame
- apply-frame
- update-stack
---



Small-step evaluation of a hypertensor section under an evaluation context stack.

## Definition
- Inputs: a [Hypertensor Section](../structure/hypertensor-section.md) and an
  [Evaluation Context Stack](../structure/evaluation-context-stack.md).
- Outputs: updated section and stack after one evaluation step.
- Behaviour: apply the top frame to the section under admissible flow/nucleus;
  update the stack accordingly (push/pop).

## Invariants
- Progress: either a step occurs or the section is in normal form (per stack).
- Preservation: evaluation step stays within admissible flow/nucleus on the section.
- Determinism: given section and stack, the next state is determined.

## Proof
- Uses: evaluation frames (stack) and flow rules on sections.
- Produces: next section/stack state.
- Shows that: small-step semantics over sections is well-defined and respects section invariants.
