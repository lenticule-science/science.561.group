---
title: Relational Physics Simulation Program
id: relational-physics-sim-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---


# Relational Physics Simulation Program

This program simulates physics directly in the relational calculus, keeping
state and dynamics as recognitions.

## Behaviour

- Represent physical entities, interactions, and states as
  [Computer Recognition](../../type/computer-recognition.md) with provenance.
- Plan simulations as [Computer Wiring Plans](../../type/computer-wiring-plan.md);
  drive execution via [Evaluate Step](../../function/evaluate-step.md).
- Snapshot simulation state via [Computer Storage](../../function/storage.md)
  and [Computer Snapshot](../../type/computer-snapshot.md).
- Record traces/measurements and compare against observations; surface failures
  as [Computer Failure](../../type/computer-failure.md).

## Intended operators

- Configure and run relational physics simulations.
- Analyse results and compare to observations.
- Share simulation slices with other programs (visualization, policy).

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program instantiates the documentation interpreter to realise the described behaviour without extending machine semantics.
