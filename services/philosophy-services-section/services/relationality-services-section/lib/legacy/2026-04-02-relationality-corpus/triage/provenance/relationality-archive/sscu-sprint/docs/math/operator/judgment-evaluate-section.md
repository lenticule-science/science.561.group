---
name: judgment-evaluate-section
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



Typed big-step/small-step evaluation of judgments over hypertensor sections,
integrating substitution and evaluation semantics.

## Definition
- Inputs: typing derivation from [Typed Judgment System](../structure/typed-judgment-system.md),
  a section to evaluate, and substitution environment (if needed).
- Output: [Proof Trace](../structure/proof-trace.md) showing evaluation steps and
  resulting typed value/section.
- Behaviour: apply [Substitute Section](substitute-section.md) as needed, then
  iterate [Evaluate Section Step](evaluate-section-step.md) under typing
  constraints, recording derivation.

## Invariants
- Type preservation: evaluated result has the derived type.
- Progress: well-typed terms evaluate or are values; failure only via failure algebra.

## Proof
- Uses: typed judgment rules, substitution, small-step evaluation.
- Produces: proof trace of evaluation.
- Shows that: evaluation is type-safe and derivations can be recorded formally.
