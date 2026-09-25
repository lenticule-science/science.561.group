---
title: Type Judgment Rule
id: type-judgment-rule
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Applies a typing rule in the typed judgment system over hypertensor sections.
---



Applies a typing rule in the typed judgment system over hypertensor sections.

## Definition
- Inputs: premises from the [Typed Judgment System](./typed-judgment-system.md)
  and a [Judgment Term](./judgment-term.md)/[Hypertensor Section](./hypertensor-section.md).
- Output: [Proof Trace](./proof-trace.md) for the derived judgment.
- Behaviour: check premises, apply rule schema, record derivation step.

## Invariants
- Soundness: only valid rules produce proof traces.
- Compositionality: proof traces compose to full derivations.

## Proof
- Uses: typing context/rules.
- Produces: proof trace.
- Shows that: typing derivations can be recorded and checked.

## Earlier material

## Definition
- Inputs: premises from the [Typed Judgment System](typed-judgment-system.md)
  and a [Judgment Term](judgment-term.md)/[Hypertensor Section](hypertensor-section.md).
- Output: [Proof Trace](proof-trace.md) for the derived judgment.
- Behaviour: check premises, apply rule schema, record derivation step.
