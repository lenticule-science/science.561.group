---
title: Context Geometry
role: structure
derived_from:
- acts/context-geometry
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



The **Context Geometry** packages the compatibility between context flow and
context nucleus into a single structure.

## Definition
- Components: the [Flow Context](docs/math/operator/flow-context.md) and
  [Get Context Nucleus](docs/math/operator/get-context-nucleus.md) operators, with the
  coherence laws earned by [`acts/context-geometry`](docs/math/acts/context-geometry.md).
- Relation: flow and nucleus commute on contexts; the geometry records this
  compatibility.

## Invariants
- Applying flow then nucleus equals applying nucleus then flow on contexts.
- Contexts remain within the earned admissible fragment under both operators.

## Proof
Refines [`acts/context-geometry`](docs/math/acts/context-geometry.md) by
assembling the earned flow and nucleus operators into a coherent structure and
recording their commutation law. The act ensures the required coherence, so the
geometry is well-formed.
