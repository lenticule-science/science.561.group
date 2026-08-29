---
title: Intake Context Carrier
role: structure
derived_from: acts/recognize-context
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: links intake observations to recognised contexts and types.
- Source: earned from [Recognize Context](../acts/recognize-context.md); supporting acts [Collect Contexts](../acts/collect-contexts.md) and [Collect Types](../acts/collect-types.md) populate the carrier.

## Invariants
- Context/type associations are consistent with the collected recognitions.
- Closed under additional collected contexts/types without violating prior associations.

## Proof
- Derived from: [Recognize Context](../acts/recognize-context.md), which witnesses intake contexts.
- Shows that: recognising contexts and collecting their instances yields the intake context carrier linking observations to recognised contexts/types.
