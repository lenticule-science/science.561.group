---
name: syntax-admissible-derivations
role: structure
derived_from:
- acts/step-trace
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The syntactic structure is the graph of admissible derivations: recognitions
with traces and the allowed single-step witnesses between them.

## Definition
- Acts: `StepTrace`, `Reduce`, `SeedEvaluationContext`, `BuildEvaluationContext`
  fix the step witnesses and context lifting.
- Derivation graph: vertices are recognitions with traces; edges are single-step
  witnesses lifted into contexts.
- Admissible subgraph: select the allowed edges per proof/runtime policy.

## Invariants
- Syntax equality/legality is evaluated with respect to the chosen admissible
  edges.
- Changing syntax means changing the set of allowed edges; recognitions/traces
  remain fixed.

## Proof
Derived from the step/context acts; admissible edges are a chosen subset of the
earned derivation graph, yielding the syntactic structure.
