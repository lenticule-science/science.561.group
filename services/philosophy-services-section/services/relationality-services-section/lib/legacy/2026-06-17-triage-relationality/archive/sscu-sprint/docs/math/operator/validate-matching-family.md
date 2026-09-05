---
title: Validate Matching Family
role: operator
inputs:
- id: coverage-site
  alias: site
- id: matching-family
  alias: family
outputs:
- id: matching-family
  alias: validated
transformation:
- call
  - ensure-overlap-agreement
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
- Uses: overlaps and restriction maps from the coverage site to verify
  agreement across the matching family.
- Shows that: only compatible data passes to gluing; non-matching families are
  rejected.
---

Checks that a [Matching Family](../structure/matching-family.md) over a cover in
a [Coverage Site](../structure/coverage-site.md) satisfies the overlap and
coherence conditions required for sheaf gluing.

## Proof
- Uses: cover overlaps and restriction maps from the coverage site to verify
  pairwise and triple-overlap agreement.
- Shows that: only matching data passes through to gluing; mismatches are
  rejected.
