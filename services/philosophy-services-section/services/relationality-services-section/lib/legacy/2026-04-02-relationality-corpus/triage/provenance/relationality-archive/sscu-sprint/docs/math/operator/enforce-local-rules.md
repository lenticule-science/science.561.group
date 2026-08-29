---
name: enforce-local-rules
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



Checks/enforces quasicrystalline local rules on hypertensor sections.

## Definition
- Inputs: a section over a window and a set of local rules from
  [Quasicrystalline Constraint](../structure/quasicrystalline-constraint.md).
- Outputs: verified/annotated constraint satisfaction.

## Invariants
- Local: enforcement uses only finite window data.
- Stable under restriction: if a section satisfies rules on a window, its
  restrictions satisfy them on sub-windows.

## Proof
- Uses: [Quasicrystalline Constraint](../structure/quasicrystalline-constraint.md).
- Shows that: local rules can be enforced/checked on sections, yielding the
  quasicrystalline subclass.
