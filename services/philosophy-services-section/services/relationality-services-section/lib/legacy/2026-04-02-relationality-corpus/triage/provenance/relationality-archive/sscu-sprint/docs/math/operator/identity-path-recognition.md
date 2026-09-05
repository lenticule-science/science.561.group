---
name: identity-path-recognition
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



Recognises paths where flow followed by nucleus leaves recognitions invariant.

## Definition
- Inputs: a [Directed Path](../structure/directed-path.md) and its identity path
  from [Identify Path](path-identity.md).
- Output: recognition indicating whether the path is homotopic to identity
  (invariant under flow/nucleus).
- Behaviour: compare path composition with identity, collapse under nucleus,
  report invariance.

## Invariants
- True on loops contractible to identity; false otherwise.
- Stable under homotopy.

## Proof
- Uses: path identity and directed paths.
- Produces: recognition of identity equivalence.
- Shows that: invariance along paths is recognisable in the homotopy framework.
