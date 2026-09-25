---
title: Typed Recognition Combinator
id: typed-recognition-combinator
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Applies a typed logical combinator (and/or/not/implication/modus ponens) within the recognition type system, producing a proof trace.
---



Applies a typed logical combinator (and/or/not/implication/modus ponens) within
the recognition type system, producing a proof trace.

## Definition
- Inputs: premises in the [Recognition Type System](../structure/recognition-type-system.md).
- Output: [Proof Trace](./proof-trace.md) of the combined recognition.
- Behaviour: check typing, apply the combinator (e.g., modus ponens), and emit
  derivation trace.

## Invariants
- Type soundness: only well-typed combinators produce proofs.
- Normalisation: resulting recognition can be semantically collapsed to normal form.

## Proof
- Uses: type system rules and combinators.
- Produces: proof trace.
- Shows that: logical operations are type-directed and derivations are recorded.

## Earlier material

## Definition
- Inputs: premises in the [Recognition Type System](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/recognition-type-system.md).
- Output: [Proof Trace](proof-trace.md) of the combined recognition.
- Behaviour: check typing, apply the combinator (e.g., modus ponens), and emit
  derivation trace.
