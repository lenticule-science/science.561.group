---
title: Sheaf
id: sheaf
role: structure
status: plan
derived_from: math/acts/sheafification
proof_refs: []
---



Earned subcategory of presheaves that satisfy the
[SheafCondition](./sheaf-condition.md) over a [Coverage Site](./coverage-site.md),
packageable through the sheafification act.

## Definition
- Objects: presheaves on the coverage site whose restriction maps turn every
  cover into a [Matching Family](./matching-family.md) with a unique amalgamated
  section.
- Morphisms: natural transformations preserving restriction maps and the
  matching-to-gluing property.
- Sheafification: left adjoint to inclusion of sheaves into presheaves; freely
  adds amalgams so the sheaf condition holds for the chosen coverage.
- Locality data: equalizer diagrams for restrictions over overlaps encode
  locality, and gluing diagrams encode existence/uniqueness.

## Invariants
- Locality: sections agreeing on all overlaps are equal after restriction.
- Glueability: every [Matching Family](./matching-family.md) has a unique amalgam
  consistent with restrictions.
- Base-change stability: pullbacks along the coverage preserve sheaves and their
  gluing data.
- Path compatibility: restriction along composed paths in the
  [Fundamental Groupoid](./fundamental-groupoid.md) matches iterated restriction in
  the site, preventing holonomy from breaking sheaf laws.

## Proof
- Derived from: [Sheafification](./sheafification.md) which freely enforces
  the [SheafCondition](./sheaf-condition.md) on presheaves over the chosen
  coverage.
- Shows that: once coverage, restrictions, and matching families are fixed, the
  sheaf structure is the smallest stable subcategory closed under pullbacks and
  the gluing/locality laws, providing the logical substrate for classifiers and
  base change.
