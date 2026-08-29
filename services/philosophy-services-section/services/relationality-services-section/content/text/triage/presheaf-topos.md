---
title: Presheaf Topos
id: presheaf-topos
role: structure
status: plan
derived_from:
- acts/presheaf-topos
proof_refs: []
---


# Presheaf Topos

The **Presheaf Topos** is the earned category of presheaves on the relational
profile site, with finite limits and exponentials as given by
[`acts/presheaf-topos`](docs/math/acts/presheaf-topos.md).

## Definition
- Objects: presheaves over the profile site (contexts ↦ observations).
- Morphisms: natural transformations between these presheaves.
- Structure: inherits finite limits and exponentials from the act.

## Invariants
- Finite limits and exponentials exist as earned by the act.
- Restrictions respect the flow/nucleus compatibility of the profile site.

## Proof
Directly derived from `acts/presheaf-topos`, which constructs the presheaf
category and exhibits its topos structure.
