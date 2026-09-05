---
title: Ensure Overlap Agreement
id: ensure-overlap-agreement
role: operator
status: plan
inputs:
- id: coverage-site
  alias: site
- id: matching-family
  alias: family
outputs:
- id: matching-family
  alias: family
transformation:
- call
  - validate-overlaps
  - site
  - family
proof_refs:
- coverage-site
- matching-family
---

# Proof
- Uses: overlap charts and restriction maps from the coverage site to compare
  restricted sections.
- Shows that: the family satisfies pairwise/triple coherence, a prerequisite
  for sheaf gluing.
---

Verifies that the sections in a [Matching Family](./matching-family.md)
agree on all overlaps defined by the [Coverage Site](./coverage-site.md).

## Proof
- Uses: overlap charts and restriction maps from the coverage site to compare
  restricted sections via `validate-overlaps`.
- Shows that: the family satisfies pairwise/triple coherence, a prerequisite
  for sheaf gluing.
