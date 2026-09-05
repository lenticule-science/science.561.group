---

name: reiki-system-program
kind: structure
layer: program
derived_from:
- computer/structure/computer-kernel
uses:
  - computer/operator/recognition
  - computer/operator/evaluate-step
  - computer/operator/storage
  - computer/structure/computer-recognition
  - computer/structure/computer-evaluation-state
  - computer/structure/computer-snapshot
produces:
  - computer/structure/computer-wiring-plan
---

This program models Reiki practices as recognitions so sessions, symbols, and
lineages are explicit and traceable.

## Behaviour

- Represent attunements, symbols, sessions, and practitioners as
  [Computer Recognitions](../../../computer/structure/computer-recognition.md)
  with provenance and consent/policy bindings.
- Link practices to contexts and outcomes; respect privacy and boundaries via
  policy-regime recognitions.
- Measure session frequency, reported effects, and lineage integrity; persist
  via [Computer Storage](../../../computer/operator/storage.md) and
  [Computer Snapshot](../../../computer/structure/computer-snapshot.md).

## Intended operators

- Record and schedule sessions; track attunements and symbols used using
  [Computer Recognition](../../../computer/operator/recognition.md).
- Reflect on outcomes and adjust practice with consent; drive updates via
  [Evaluate Step](../../../computer/operator/evaluate-step.md) over a
  Reiki-specific [Computer Wiring Plan](../../../computer/structure/computer-wiring-plan.md).
- Share or teach practices while preserving provenance and policy; save/load
  via [Computer Storage](../../../computer/operator/storage.md).

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the
  described behaviour without extending machine semantics; all state/flow is
  expressed via computer carriers and operators.
