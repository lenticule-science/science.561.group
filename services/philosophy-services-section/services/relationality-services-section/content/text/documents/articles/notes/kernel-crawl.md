---
title: Kernel Crawl
id: kernel-crawl
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Kernel Crawl

Traverses the wiring/ports to enumerate reachable operators, carriers, and
bindings in a wiring plan, producing annotations or failures.

## Definition
- Inputs: [Wiring Plan](./wiring-plan.md) and its underlying
  [Connection Graph](./connection-graph.md).
- Outputs: annotated wiring plan or [Failure Algebra](./failure-algebra.md)
  element on invalid wiring.
- Behaviour:
  1. Perform a graph traversal from entry steps, recording reachable operators
     and carrier-labelled ports.
  2. Check each edge for type compatibility; log a failure on mismatch.
  3. Detect cycles; if present, emit failure and stop traversal.
  4. Return the wiring plan annotated with reachability and discovered gaps.

## Invariants
- Read-only: does not mutate carrier state beyond annotating the plan.
- Typing: only well-typed ports/operators are recorded; mismatches yield
  failures.
- Acyclicity: cycles are reported as failures; traversal is otherwise exhaustive.

## Proof
- Uses: [Connection Graph](./connection-graph.md) for traversal rules
  and [Wiring Plan](./wiring-plan.md) typing/acyclicity constraints.
- Shows that: traversing a well-typed, acyclic wiring plan yields reachability
  annotations; ill-typed edges or cycles are captured as failure algebra
  elements.
