---

name: interpreter-program
kind: structure
layer: program
derived_from: computer/structure/computer-kernel
uses:
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
  - computer/structure/computer-snapshot
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
produces:
  - computer/structure/computer-wiring-plan
used_by: []
produced_by: []
---

Program-level runbook that turns source text into an executable computer
wiring plan and drives it over the computer kernel carriers.

## Definition
- Inputs: source text/commands ingested via computer [Recognition](../../../computer/operator/recognition.md).
- Plan: build a [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md)
  representing the interpreted program, bind it into a
  [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md),
  and step it with [Evaluate Step](../../../computer/operator/evaluate-step.md).
- Persistence: checkpoint via [Computer Storage](../../../computer/operator/storage.md)
  and [Computer Snapshot](../../../computer/structure/computer-snapshot.md).
- Outputs: executable wiring plan and updated evaluation state/failures surfaced
  through computer carriers.

## Invariants
- No machine bypass: all parsing/binding goes through computer recognition and
  wiring operators.
- Determinism: given the same source and snapshot, produces the same wiring
  plan and evaluation behaviour.
- Failure purity: failures surface as [Computer Failure](../../../computer/structure/computer-failure.md);
  no state mutation on failure.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: interpreting source into a wiring plan and executing it via
  computer operators yields a runnable interpreter without extending machine
  semantics.
