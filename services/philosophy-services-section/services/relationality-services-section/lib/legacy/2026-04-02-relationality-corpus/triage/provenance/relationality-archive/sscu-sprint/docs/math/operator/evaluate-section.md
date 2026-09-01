---
name: evaluate-section
role: operator
inputs:
- id: hypertensor-section
  alias: section
- id: evaluation-context-stack
  alias: stack
outputs:
- id: hypertensor-section
  alias: result-section
- id: evaluation-context-stack
  alias: result-stack
transformation:
- let
  - step
    - call
      - evaluate-section-step
      - section
      - stack
  - return
    - step
proof_refs:
- evaluate-section-step
- hypertensor-section
- evaluation-context-stack
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Big-step evaluation of a hypertensor section to a normal form under the earned
flow/nucleus rules.

## Definition
- Inputs: a [Hypertensor Section](../structure/hypertensor-section.md) and an
  [Evaluation Context Stack](../structure/evaluation-context-stack.md).
- Outputs: section in normal form (or failure), with stack emptied.
- Behaviour: iterate [Evaluate Section Step](evaluate-section-step.md) until
  normal form or failure per failure algebra.

## Invariants
- Termination on finite sections or diverges; preserves flow/nucleus admissibility.
- Determinism given an evaluation strategy and stack discipline.

## Proof
- Uses: small-step semantics over sections to compose big-step.
- Shows that: big-step evaluation is well-defined and respects section/gluing invariants.
