---
name: crossflow-exchange
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Law describing when two independent flow directions can be swapped (exchanged)
without violating admissibility.

## Definition
- Components: two flow directions with commutation data encoded as shuffle
  equivalences and admissibility constraints.
- Witness: recognition that exchanging the flows yields equivalent outcome.

## Invariants
- Commutation: exchange valid when flows commute up to shuffle/nucleus.
- Safety: illegal exchanges detected by violation witnesses.

## Proof
- Uses: flow context and shuffle structure to encode exchange legality.
- Shows that: multidimensional flows can swap when admissible.
