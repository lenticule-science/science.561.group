---
title: Detect Phase Synchronization
id: detect-phase-synchronization
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Detect Phase Synchronization

Detects phase-synchronized recognitions under harmonic flow.

## Definition
- Inputs: sections/recognitions and [Harmonic Flow](harmonic-flow.md).
- Output: [Phase-Synchronized Recognition](../structure/phase-synchronized-recognition.md)
  witnesses if phases remain locked.
- Behaviour: track phase relationships across harmonic modes under evolution;
  mark synchrony when maintained.

## Invariants
- Robustness: synchrony persists under small perturbations.
- Stability: synchrony recognition is stable under continued harmonic flow.

## Proof
- Uses: harmonic flow to evaluate phase coherence.
- Produces: synchrony witness.
- Shows that: phase synchronization can be recognised in the harmonic setting.
