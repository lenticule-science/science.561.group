---
title: Matching Family
id: matching-family
role: structure
status: plan
proof_refs:
- sheaf-condition
- coverage-site
- sheaf
fields:
- name: cover
  type: trace
  description: family `{Ui → U}` in the coverage site.
- name: sections
  type: trace
  description: assignments `si` over each `Ui`.
- name: overlaps
  type: trace
  description: coherence witnesses for overlaps/triple intersections.
---

# Matching Family

Carrier for compatible sections over a cover in a [Coverage Site](./coverage-site.md),
built to feed the sheaf condition earned from
[SheafCondition](./sheaf-condition.md).

## Definition
- Cover: a family `{Ui → U}` in the [Coverage Site](./coverage-site.md).
- Sections: assignments `si` over each `Ui` whose restrictions agree on overlaps
  `Ui ×_U Uj`.
- Overlap coherence: coherence witnesses for triple overlaps ensuring the
  pairwise agreements assemble into a simplicial compatibility.
- Packaging: the structure stores the cover, sections, and compatibility data so
  gluing operators can produce a unique global section when permitted.

## Invariants
- Compatibility: `si|Ui∩Uj = sj|Ui∩Uj` for all indices with higher coherence on
  triple intersections.
- Refinement stability: refining the cover produces another matching family via
  restriction; coherence is preserved.
- Transportability: restriction along paths in the
  [Fundamental Groupoid](./fundamental-groupoid.md) preserves the matching
  property so path composition does not break glueability.

## Proof
- Derived from: [SheafCondition](./sheaf-condition.md) which states that
  such compatible families must glue uniquely.
- Shows that: once covers and restrictions are fixed, the matching-family
  carrier captures exactly the compatible data required by sheaf gluing,
  making locality and coverage explicit.
