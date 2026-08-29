---
name: evaluation-context-compatibility
role: operator
derived_from: acts/build-evaluation-context
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



## Definition
- Inputs: earned evaluation contexts from [Build Evaluation Context](../acts/build-evaluation-context.md).
- Outputs: guarantee that reducibility/normalization proofs respect these contexts.
- Behaviour: ensures operational steps are compatible with the evaluation-context structure.

## Invariants
- Evaluation contexts remain well-formed under reduction/normalization.
- Flow/normalization steps preserve context shape.

## Proof
- Derived from: [Build Evaluation Context](../acts/build-evaluation-context.md).
- Uses: [Flow Normalization Compatibility](flow-normalization-compatibility.md) to align flow with normalization inside contexts.
- Shows that: reducibility and normalization respect earned evaluation contexts in the judgement calculus.
