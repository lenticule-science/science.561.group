---
title: Enforce Local Rules
id: enforce-local-rules
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Checks/enforces quasicrystalline local rules on hypertensor sections.
---



Checks/enforces quasicrystalline local rules on hypertensor sections.

## Definition
- Inputs: a section over a window and a set of local rules from
  [Quasicrystalline Constraint](./quasicrystalline-constraint.md).
- Outputs: verified/annotated constraint satisfaction.

## Invariants
- Local: enforcement uses only finite window data.
- Stable under restriction: if a section satisfies rules on a window, its
  restrictions satisfy them on sub-windows.

## Proof
- Uses: [Quasicrystalline Constraint](./quasicrystalline-constraint.md).
- Shows that: local rules can be enforced/checked on sections, yielding the
  quasicrystalline subclass.

## Earlier material

## Definition
- Inputs: a section over a window and a set of local rules from
  [Quasicrystalline Constraint](quasicrystalline-constraint.md).
- Outputs: verified/annotated constraint satisfaction.

## Proof
- Uses: [Quasicrystalline Constraint](quasicrystalline-constraint.md).
- Shows that: local rules can be enforced/checked on sections, yielding the
  quasicrystalline subclass.
