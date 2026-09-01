---
title: Typed Judgment System
id: typed-judgment-system
role: structure
status: plan
proof_refs: []
---



Typed judgments over hypertensor sections with derivation histories.

## Definition
- Components: typing contexts, [Judgment Terms](./judgment-term.md) annotated with
  [Hypertensor Section](./hypertensor-section.md) types, and [Proof Traces](./proof-trace.md).
- Rules: inference rules assigning types to terms/sections; derivations recorded
  as proof traces.

## Invariants
- Soundness: only derivable judgments are admitted.
- Preservation: evaluation preserves types.
- Progress: well-typed terms either evaluate or are values.

## Proof
- Uses: judgment terms, section types, and proof traces to define the typing
  system.
- Shows that: typing is coherent and supports derivation tracking for DSL specs.
