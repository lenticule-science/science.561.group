---
title: Hypertensor Sheaf Condition
id: hypertensor-sheaf-condition
role: structure
status: plan
proof_refs:
- hypertensor-site
- sheaf-glue
- sheaf-locality
- matching-family
derives-from: hypertensor-site
description: Packages gluing and locality for the hypertensor sheaf over the hypertensor site.
---


Packages gluing and locality for the hypertensor sheaf over the hypertensor
site.

## Definition
- Gluing: every [Matching Family](./matching-family.md) over a cover has a unique
  amalgam ([Sheaf Glue](./sheaf-glue.md)).
- Locality: sections equal on a cover are equal globally ([Sheaf Locality](./sheaf-locality.md)).

## Invariants
- Sheaf axioms hold for the hypertensor site.
- Stable under cover refinement.

## Proof
- Derived from: [Hypertensor Site](./hypertensor-site.md).
- Uses: [Sheaf Glue](./sheaf-glue.md) and [Sheaf Locality](./sheaf-locality.md).
- Shows that: the hypertensor presheaf satisfies the sheaf condition.
