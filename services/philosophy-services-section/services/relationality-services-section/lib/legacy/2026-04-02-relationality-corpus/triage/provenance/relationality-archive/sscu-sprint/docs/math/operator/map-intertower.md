---
name: map-intertower
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



Applies an intertower map to transport recognitions between tower geometries.

## Definition
- Inputs: an [InterTower Map](../structure/intertower-map.md) and recognitions in
  one tower.
- Output: mapped recognitions in the target tower, updating the intertower map
  if needed.
- Behaviour: apply the functorial correspondences respecting flow/nucleus and
  tower transitions.

## Invariants
- Coherence: mapping commutes with tower transitions.
- Soundness: mapped recognitions preserve earned invariants.

## Proof
- Uses: intertower map structure and tower data.
- Produces: mapped recognitions/intertower map.
- Shows that: cross-tower transport is executable and coherent.
