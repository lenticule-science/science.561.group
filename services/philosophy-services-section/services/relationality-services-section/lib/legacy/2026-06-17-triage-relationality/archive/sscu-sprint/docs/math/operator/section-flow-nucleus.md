---
title: Section Flow and Nucleus
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



Flow and nucleus acts specialise to section operators

```text
flow_section    : Section ⟶ Section
nucleus_section : Section ⟶ Section
```

with commutation up to earned equivalence by
[`commute-flow-and-nucleus`](../../math/acts/commute-flow-and-nucleus.md).

- [`flow`](../../math/acts/flow.md) acts on sections to evolve them.
- [`nucleate`](../../math/acts/nucleate.md) contracts sections to nuclei.

These operators keep sections within the earned sheaf and satisfy the earned
commutation law.

## Definition
- Inputs/Outputs: [Quasicrystalline Hypertensor Sheaf Section](../structure/quasicrystalline-hypertensor-sheaf-section.md).
- Behaviour: apply flow and nucleus to sections with commutation up to earned
  equivalence: `flow ∘ nucleus ≃ nucleus ∘ flow`.

## Invariants
- Flow–nucleus commutation holds on sections.
- Sections remain within the earned sheaf; no new carriers introduced.

## Proof
- Uses: [Commute Flow and Nucleus](commute-flow-and-nucleus.md) to justify the
  commutation law on sections.
- Shows that: lifting flow/nucleus to sections preserves the commutation law
  and keeps sections within the sheaf.
