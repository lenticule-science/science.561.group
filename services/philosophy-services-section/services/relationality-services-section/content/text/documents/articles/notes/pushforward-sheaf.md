---
title: Pushforward Sheaf
id: pushforward-sheaf
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Pushes a hypertensor sheaf along a site morphism, preserving exactness where
available.

## Definition
- Inputs: a [Sheaf Morphism](./sheaf-morphism.md) along a map of
  [Hypertensor Site](./hypertensor-site.md) objects.
- Output: pushed [Hypertensor Sheaf](./hypertensor-sheaf.md) on the
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
