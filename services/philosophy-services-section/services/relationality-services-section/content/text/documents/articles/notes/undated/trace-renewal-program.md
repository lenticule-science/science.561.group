---
title: Trace Renewal Program
kind: structure
layer: program
status: someday
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
derives-from:
  - machine/structure/wiring-plan
description: "Maintains and renews traces over time: rolling windows, pruning, and re-attestation of recognitions."
---

Maintains and renews traces over time: rolling windows, pruning, and
re-attestation of recognitions.

## Behaviour
- Identify traces needing renewal; validate policy and topology scopes.
- Re-attest recognitions, prune obsolete links, and persist updated trace
  snapshots.
- Emit [`FailureCarrier`](../failure-carrier.md) on
  inconsistencies or policy violations.

## Invariants
- Renewed traces remain consistent and traceable to acts/specs.
- Policy and placement constraints are respected.
- Failures are captured as failure carriers.

## Proof
Refines [WiringPlan](../wiring-plan.md) by specialising to
trace renewal wiring, preserving kernel semantics and failure handling.
