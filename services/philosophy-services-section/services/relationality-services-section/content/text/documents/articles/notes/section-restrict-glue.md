---
title: Sheaf Restrict and Glue
id: section-restrict-glue
role: operator
status: plan
inputs:
- id: coverage-site
  alias: site
- id: matching-family
  alias: family
outputs:
- id: hypertensor-section
  alias: glued
- id: failure-carrier
  alias: failure
transformation:
- let
  - valid
    - call
      - check-matching-family
      - site
      - family
  - glued
    - call
      - sheaf-glue
      - site
      - valid
  - return
    - glued
proof_refs:
- coverage-site
- matching-family
- sheaf-glue
- check-matching-family
description: "Earned sheaf acts provide the section operators:"
---



Earned sheaf acts provide the section operators:

```text
restrict : Section × Window_sub ⟶ Section_sub
glue     : {s_i on U_i compatible} ⟶ Section
```

- [`presheaf`](./presheaf.md) supplies restriction maps over
  admissible windows.
- [`sheaf-condition`](./sheaf-condition.md) and
  [`sheafification`](./sheafification.md) earn the gluing
  operation for compatible local sections.

These are the canonical section operators for the quasicrystalline hypertensor
sheaf.

## Definition
- Inputs: [Quasicrystalline Hypertensor Sheaf Section](./quasicrystalline-hypertensor-sheaf-section.md)
  and admissible windows/subcovers.
- Outputs: restricted sections on subwindows and glued sections from
  compatible families.
- Behaviour: apply restriction maps and glue compatible local sections to yield
  global sections, respecting sheaf axioms.

## Invariants
- Sheaf condition holds: glued sections restrict to the originals; uniqueness
  of glued sections up to earned equivalence.
- Restriction/glue commute with flow–nucleus dynamics.

## Proof
- Uses: [Coverage Site](./coverage-site.md) covers/restrictions,
  [Hypertensor Site](./hypertensor-site.md) as the underlying site,
  `check-matching-family` to validate compatibility, and `sheaf-glue` to
  assemble the section.
- Shows that: applying restriction/glue to quasicrystalline sections preserves
  sheaf axioms and flow–nucleus dynamics on the section.
