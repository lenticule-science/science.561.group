---
name: strategic-update
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



Agents alter behaviour to improve utility recognitions.

## Definition
- Inputs: an [Agent](../structure/agent.md) and utility assessments from
  [Utility Recognition](utility-recognition.md).
- Output: updated [Agent](../structure/agent.md) with adjusted epistemic/norm
  choices to improve utility.
- Behaviour: adjust beliefs/strategies along directions that increase utility
  recognitions while respecting norms/flow.

## Invariants
- Norm compliance: updates stay within the agent’s norm regime.
- Improvement: utility recognition should not decrease (locally) after update.

## Proof
- Uses: [Agent](../structure/agent.md) and [Utility Recognition](utility-recognition.md).
- Produces: updated [Agent](../structure/agent.md).
- Shows that: strategic updates can be modelled recognitionally, keeping
  consistency with flow/norm structure.
