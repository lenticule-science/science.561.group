---
name: flow-judgment
role: operator
derived_from:
- acts/flow-judgement
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



The **Flow Judgment** operator transports judgment traces through evaluation
contexts.

## Definition
- Input: a judgment triad trace.
- Output: a judgment triad trace advanced along evaluation context flow.
- Behaviour: applies the flow-judgment act to move judgment traces through
  evaluation contexts, preserving admissibility.

## Invariants
- Flow preserves judgment structure and admissibility.
- Judgments remain within the triad carrier.

## Proof
Derived from [`acts/flow-judgement`](docs/math/acts/flow-judgement.md), which
defines how judgment traces evolve under evaluation context flow.
