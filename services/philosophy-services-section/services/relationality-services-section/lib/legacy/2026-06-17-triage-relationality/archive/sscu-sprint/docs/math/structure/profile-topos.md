---
title: Profile Topos
role: structure
derived_from:
- acts/profile-topos
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Profile Topos** embeds the fixed profile category of recognitions into the
presheaf topos, preserving limits and exponentials.

## Definition
- Objects: fixed-profile recognitions viewed as presheaves.
- Morphisms: profile morphisms mapped to natural transformations.
- Embedding: a functor from the profile category into the
  [Presheaf Topos](docs/math/structure/presheaf-topos.md) that preserves the
  earned topos structure.

## Invariants
- Finite limits and exponentials are preserved by the embedding.
- Image lies inside the sheaf subcategory after sheafification.

## Proof
Derived from [`acts/profile-topos`](docs/math/acts/profile-topos.md), which
constructs the embedding and exhibits preservation of topos structure.
