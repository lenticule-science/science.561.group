---
title: Modal Logic Simulation
tags:
  - simulation
  - modal
  - box
depends_on:
  - theorem/external/relational-modal-logic
---
# Specification (Modal Logic Simulation)

Approximate **Theorem (Relational Modal Logic)** on explicit state graphs (finite
or symbolic).  We represent modal contexts via a directed graph whose edges
encode the flow–nucleus relation.

## State representation

- **State graph `G = (V, E)`.**  
  Nodes correspond to stabilized recognitions; edges carry weights describing the
  admissible flow transitions.  `V` may be finite or a symbolic set provided
  successor queries are computable.
- **Box/diamond tables.**  
  Two boolean matrices `Box[v]` and `Diamond[v]` recording whether a predicate
  holds at `v` after applying `□` or `◇`.
- **Tower cache.**  
  Array storing iterated modal applications (for `ModalityTower`). Each entry
  keeps `(level, predicate_vector)`.

## Inputs

1. Initial predicate assignment `P: V -> {0,1}` (base proposition).
2. Transition relation approximating shuffle flow.
3. KZ comparison tolerance `ε` for checking lax idempotence.

## Update procedure

1. **Apply box.**  
   For each `v`, set `Box[v] = 1` iff every successor `u` satisfies `P(u)`. This
   approximates the internal `BoxModality`.
2. **Apply diamond.**  
   Set `Diamond[v] = 1` iff some successor `u` satisfies `P(u)`.
3. **Tower iteration.**  
   Repeat steps 1–2 to populate higher levels, caching each result (or storing
   symbolic recurrences) so temporal queries can reuse the data.
4. **KZ check.**  
   Compare `Box` and `Box(Box)`; ensure `Box ≤ Box(Box)` entrywise, and that the
   difference is below `ε` to mimic the `QuadraticModality` condition.

## Invariants

- Graph edges must respect the commutation law (flow vs nucleus) by construction;
  detect violations via mismatch between expected and observed successor sets.
- Box/diamond tables should remain monotone under predicate refinement.
- Tower cache entries must stabilise when the level exceeds graph diameter.

## Outputs

- Boolean vectors for `□P`, `◇P`, and tower levels.
- Diagnostics for KZ slack, monotonicity, and cache convergence.
