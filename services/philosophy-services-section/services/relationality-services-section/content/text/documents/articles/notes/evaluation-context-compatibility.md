---
title: Evaluation Context Compatibility
id: evaluation-context-compatibility
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: acts/build-evaluation-context
---



## Definition
- Inputs: earned evaluation contexts from [Build Evaluation Context](./build-evaluation-context.md).
- Outputs: guarantee that reducibility/normalization proofs respect these contexts.
- Behaviour: ensures operational steps are compatible with the evaluation-context structure.

## Invariants
- Evaluation contexts remain well-formed under reduction/normalization.
- Flow/normalization steps preserve context shape.

## Proof
- Derived from: [Build Evaluation Context](./build-evaluation-context.md).
- Uses: [Flow Normalization Compatibility](flow-normalization-compatibility.md) to align flow with normalization inside contexts.
- Shows that: reducibility and normalization respect earned evaluation contexts in the judgement calculus.

## Earlier material

## Definition
- Inputs: earned evaluation contexts from [Build Evaluation Context](build-evaluation-context.md).
- Outputs: guarantee that reducibility/normalization proofs respect these contexts.
- Behaviour: ensures operational steps are compatible with the evaluation-context structure.

## Proof
- Derived from: [Build Evaluation Context](build-evaluation-context.md).
- Uses: [Flow Normalization Compatibility](flow-normalization-compatibility.md) to align flow with normalization inside contexts.
- Shows that: reducibility and normalization respect earned evaluation contexts in the judgement calculus.
