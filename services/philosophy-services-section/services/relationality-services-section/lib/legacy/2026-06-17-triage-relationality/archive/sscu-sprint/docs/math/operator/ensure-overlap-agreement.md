---
title: Ensure Overlap Agreement
role: operator
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
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---

# Proof
- Uses: overlap charts and restriction maps from the coverage site to compare
  restricted sections.
- Shows that: the family satisfies pairwise/triple coherence, a prerequisite
  for sheaf gluing.
---
# Ensure Overlap Agreement

Verifies that the sections in a [Matching Family](../structure/matching-family.md)
agree on all overlaps defined by the [Coverage Site](../structure/coverage-site.md).

## Proof
- Uses: overlap charts and restriction maps from the coverage site to compare
  restricted sections via `validate-overlaps`.
- Shows that: the family satisfies pairwise/triple coherence, a prerequisite
  for sheaf gluing.
