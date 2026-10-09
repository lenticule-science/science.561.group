---
title: Observation Equivalence (CIU)
id: observation-equivalence
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: "The observation-equivalence acts define contextual indistinguishability of observations: two observations are equivalent iff no earned observation context can distinguish them (CIU)."
---



The observation-equivalence acts define contextual indistinguishability of
observations: two observations are equivalent iff no earned observation context
can distinguish them (CIU).

## Definition
- Inputs/Outputs: observation values within the earned observation carrier.
- Behaviour: two observations are equivalent when every observation context
  yields the same result (contextual CIU criterion), incorporating normalisation
  and trace-based reentry.

## Invariants
- Contextual indistinguishability: preserved under earned observation contexts.
- Trace compatibility: equivalence respects trace/reentry acts.

## Proof
- Uses: [Observation](./observation.md) and its earned contexts to
  witness indistinguishability.
- Shows that: contextual equivalence of observations holds when every earned
  context yields nucleus-equivalent results, providing the CIU relation for
  observations.
