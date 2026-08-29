---
title: Sheaf Glue
id: sheaf-glue
role: operator
status: plan
inputs:
- id: coverage-site
  alias: site
- id: matching-family
  alias: family
outputs:
- id: hypertensor-section
  alias: section
transformation:
- let
- - valid
  - - call
    - check-matching-family
    - site
    - family
- - return
  - - call
    - construct-glued-section
    - valid
proof_refs:
- hypertensor-site
- matching-family
- check-matching-family
- construct-glued-section
---

# Glue Sheaf

Glues a matching family of sections over a cover of windows into a unique
global section, enforcing the sheaf condition.

## Definition
- Inputs:
  - A cover of a window by sub-windows in [Hypertensor Site](./hypertensor-site.md).
  - A [Matching Family](./matching-family.md) of sections in
    [Hypertensor Section](./hypertensor-section.md) agreeing on overlaps.
- Output: a unique global section over the covered window in
  [Hypertensor Section](./hypertensor-section.md).
- Behaviour:
  1. Check matching on pairwise overlaps.
  2. Construct the amalgamated section.
  3. Verify uniqueness up to earned equivalence.

## Invariants
- Locality: if two glued sections agree on all sub-windows of a cover, they are
  equal.
- Gluing: every matching family admits a unique amalgamation.
- Compatibility: respects restriction maps of the [Sheaf](./sheaf.md).

## Proof
- Uses: [Hypertensor Site](./hypertensor-site.md) coverage and
  restriction structure plus [Matching Family](./matching-family.md)
  witnesses; validation via `check-matching-family`; construction via
  `construct-glued-section`.
- Shows that: the earned sheaf condition holds by producing unique amalgams
  from matching families over covers.
