---
name: typed-recognition-combinator
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



Applies a typed logical combinator (and/or/not/implication/modus ponens) within
the recognition type system, producing a proof trace.

## Definition
- Inputs: premises in the [Recognition Type System](../structure/recognition-type-system.md).
- Output: [Proof Trace](../structure/proof-trace.md) of the combined recognition.
- Behaviour: check typing, apply the combinator (e.g., modus ponens), and emit
  derivation trace.

## Invariants
- Type soundness: only well-typed combinators produce proofs.
- Normalisation: resulting recognition can be semantically collapsed to normal form.

## Proof
- Uses: type system rules and combinators.
- Produces: proof trace.
- Shows that: logical operations are type-directed and derivations are recorded.
