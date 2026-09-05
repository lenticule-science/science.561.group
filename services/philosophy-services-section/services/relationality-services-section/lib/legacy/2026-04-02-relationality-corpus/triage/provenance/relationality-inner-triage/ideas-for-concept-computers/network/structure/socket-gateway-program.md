---

name: socket-gateway-program
kind: structure
layer: program
derived_from: computer/structure/computer-kernel
uses:
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
  - computer/structure/computer-wiring-plan
  - computer/structure/computer-evaluation-state
produces:
  - computer/structure/computer-wiring-plan
used_by: []
produced_by: []
---

Program-level gateway that exposes the computer kernel over line-oriented
network sockets (TCP/WebSocket), translating socket I/O into recognised
commands and wiring-plan updates.

## Definition
- Inputs: socket connections carrying line/JSON frames; initial
  [Computer Evaluation State](../../../computer/structure/computer-evaluation-state.md).
- Behaviour:
  1. Accept connections; recognise inbound frames via computer
     [Recognition](../../../computer/operator/recognition.md) into commands.
  2. Splice commands into a [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md)
     and step with [Evaluate Step](../../../computer/operator/evaluate-step.md).
  3. Surface results/failures back over the socket; optionally checkpoint via
     [Storage](../../../computer/operator/storage.md).
- Outputs: updated wiring plan/evaluation state and socket responses (results or
  [Computer Failure](../../../computer/structure/computer-failure.md)).

## Invariants
- Protocol safety: only recognised commands are accepted; malformed frames are
  rejected without mutating state.
- Isolation: per-connection bindings are isolated; shared state changes flow
  through the computer kernel.
- Failure purity: failures are surfaced as computer failures; state unchanged on
  failure.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: translating socket I/O into recognised commands and executing
  them via computer operators yields a network gateway without extending kernel
  semantics.
