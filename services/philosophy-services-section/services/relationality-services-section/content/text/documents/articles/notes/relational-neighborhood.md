---
title: Relational Neighborhood
id: relational-neighborhood
role: structure
status: plan
proof_refs: []
description: Minimal context expansion needed to stabilise a recognition—an “open ball” in the relational setting.
---



Minimal context expansion needed to stabilise a recognition—an “open ball” in
the relational setting.

## Definition
- Carrier: set of recognitions reachable from a given recognition by one step
  of [Flow Context](./flow-context.md) followed by nucleus closure.
- Basepoint: the seed recognition around which the neighborhood is formed.

## Invariants
- Minimality: contains all flow-successors within one nucleus class; nothing
  outside that class.
- Stability: closed under nucleus; remains within admissible flow domain.

## Proof
- Uses: [Flow Context](./flow-context.md) to generate successors and
  [Recognition Carrier](./recognition.md) as ambient space.
- Shows that: neighborhoods are well-defined relational open sets for metric
  and topology analogues.
