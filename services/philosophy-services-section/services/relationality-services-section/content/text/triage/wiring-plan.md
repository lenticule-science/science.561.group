---
title: Wiring Plan
id: wiring-plan
role: structure
status: plan
proof_refs:
- connection-graph
- extract-graph-ports
- extract-graph-edges
- are-graph-ports-well-typed
- are-graph-edges-well-typed
- is-graph-acyclic
- get-graph-entry-steps
- get-graph-exit-steps
---

# Wiring Plan

Wiring plan refining the connection graph into a concrete plan over earned
operators and ports.

## Definition
- Steps: finite set of operator invocations drawn from
  [Recognition](../operator/recognition.md), [Evaluation Step](../operator/evaluate-step.md),
  [Storage](../operator/storage.md), and [Wiring](../operator/wiring.md).
- Ports: typed input/output ports for each step, labelled by earned carriers
  (`RecognitionCarrier`, `EvaluationState`, `Snapshot`, `WiringPlan`,
  `FailureCarrier`).
- Edges: directed connections from output ports to input ports respecting the
  carrier types and acyclicity (no cycles).
- Entry/exit: designated source steps with no inputs and sink steps whose
  outputs are observed externally.

## Invariants
- Type safety: every edge connects ports with identical carrier types.
- Acyclicity: the directed graph over steps has no cycles; supports a topological order.
- Total wiring: every non-entry input port is driven by exactly one upstream edge.
- Failure propagation: any edge carrying `FailureCarrier` may short-circuit downstream steps according to the evaluation-state rules.

## Proof
- Uses: [Connection Graph](connection-graph.md) plus extraction/typing/acyclicity
  checks ([extract-graph-ports](../operator/extract-graph-ports.md),
  [extract-graph-edges](../operator/extract-graph-edges.md),
  [are-graph-ports-well-typed](../operator/are-graph-ports-well-typed.md),
  [are-graph-edges-well-typed](../operator/are-graph-edges-well-typed.md),
  [is-graph-acyclic](../operator/is-graph-acyclic.md)) to validate ports/edges
  and entry/exit steps.
- Shows that: a wiring plan is a typed, acyclic refinement of the connection
  graph with designated entry/exit, ready for evaluation.
