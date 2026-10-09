---
title: Substitute Section
id: substitute-section
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Typed substitution/effect calculus lifted to hypertensor sections.
---



Typed substitution/effect calculus lifted to hypertensor sections.

## Definition
- Inputs: a [Hypertensor Section](./hypertensor-section.md) with
  placeholders/binders and a substitution mapping via
  [Recognition Substitution](../operator/recognition-substitution.md).
- Output: section with placeholders replaced by provided recognitions/sections.
- Behaviour: apply substitution pointwise, respecting sheaf/flow structure and
  section typing.

## Invariants
- Type preservation: substitution maintains section types if mapping is well-typed.
- Sheaf compatibility: substitutions commute with restriction/gluing.

## Proof
- Uses: recognition substitution rules lifted to sections.
- Produces: substituted section.
- Shows that: substitution is well-defined and type-preserving on sections.
