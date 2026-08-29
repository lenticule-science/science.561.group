---
title: Profile Tower
role: structure
derived_from:
- acts/build-profile-tower
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Profile Tower** is the tower of recognitions built by repeatedly stacking
profiles, earned by [`acts/build-profile-tower`](docs/math/acts/build-profile-tower.md).

## Definition
- Cells: recognitions at increasing heights built by the act.
- Structure: includes face/degeneracy maps as provided by the act.

## Invariants
- Tower composition laws (faces/degeneracies) hold.
- Each level remains within the earned profile recognitions.

## Proof
Direct from `build-profile-tower`, which constructs the tower and its maps.
