---
title: Pullback Sheaf
id: pullback-sheaf
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Pulls a hypertensor sheaf back along a site morphism, preserving sheaf structure.
---



Pulls a hypertensor sheaf back along a site morphism, preserving sheaf structure.

## Definition
- Inputs: a [Sheaf Morphism](./sheaf-morphism.md) and a map in the
  [Hypertensor Site](./hypertensor-site.md).
- Output: pulled [Hypertensor Sheaf](./hypertensor-sheaf.md) on the
  source site.
- Behaviour: compose sections with the site map; gluing/locality inherited.

## Invariants
- Functoriality: pullback respects composition of site maps.
- Sheaf preservation: pullback of a sheaf is a sheaf; matching/gluing preserved.

## Proof
- Uses: sheaf morphism naturality and site pullbacks.
- Produces: pulled-back sheaf.
- Shows that: sheaves restrict along site maps without breaking earned axioms.

## Earlier material

## Definition
- Inputs: a [Sheaf Morphism](sheaf-morphism.md) and a map in the
  [Hypertensor Site](hypertensor-site.md).
- Output: pulled [Hypertensor Sheaf](hypertensor-sheaf.md) on the
  source site.
- Behaviour: compose sections with the site map; gluing/locality inherited.
