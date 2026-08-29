---
title: Pushforward Sheaf
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Pushes a hypertensor sheaf along a site morphism, preserving exactness where
available.

## Definition
- Inputs: a [Sheaf Morphism](../structure/sheaf-morphism.md) along a map of
  [Hypertensor Site](../structure/hypertensor-site.md) objects.
- Output: pushed [Hypertensor Sheaf](../structure/hypertensor-sheaf.md) on the
  target site.
- Behaviour: right Kan-like image of sections along the site map; preserves
  finite limits when the morphism is exact.

## Invariants
- Functoriality: composition of site maps corresponds to composition of pushforwards.
- Exactness: preserves limits/gluing under exact site maps.

## Proof
- Uses: sheaf morphism and site structure to define direct image.
- Produces: pushed sheaf.
- Shows that: sheaves transport along site maps preserving earned structure.
