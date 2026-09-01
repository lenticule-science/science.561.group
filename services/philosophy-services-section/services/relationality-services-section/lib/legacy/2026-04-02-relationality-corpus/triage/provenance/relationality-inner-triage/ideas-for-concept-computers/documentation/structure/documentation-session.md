---

name: documentation-session
kind: structure
layer: program
derived_from: computer/structure/computer-evaluation-state
uses: []
produces: []
used_by:
  - program/documentation/operator/documentation-measure
  - program/documentation/operator/documentation-nucleation
produced_by:
  - program/documentation/operator/documentation-nucleation
---

Program-level session carrier binding a workspace to an evaluation context for
measurement/rewrite runs.

## Definition
- Carrier: projection of [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md)
  scoped to documentation tasks (pending measurements/rewrites, ready queue,
  failure slot).
- Fields: wiring plan reference, ready tasks, bindings to workspace/snapshot,
  last failure (if any).
- Purpose: drive measurement and nucleation steps deterministically over a
  documentation corpus.

## Invariants
- Task ordering: respects precedence derived from wiring plan and dependency
  graph.
- Failure purity: failures do not mutate workspace; failure slot records cause.
- Stability: session can be snapshotted and resumed via documentation
  transcripts.

## Proof
- Derived from: [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md).
- Shows that: specialising evaluation state to documentation tasks yields a
  safe session carrier for repeated measurement and rewrite runs.
