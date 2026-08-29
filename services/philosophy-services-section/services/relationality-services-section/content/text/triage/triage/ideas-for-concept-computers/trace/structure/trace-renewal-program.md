---
title: Trace Renewal Program
kind: structure
layer: program
status: someday
derived_from:
- machine/structure/wiring-plan
uses:
- machine/structure/recognition-carrier
- machine/structure/failure-carrier
produces: []
---
# Trace Renewal Program

Maintains and renews traces over time: rolling windows, pruning, and
re-attestation of recognitions.

## Behaviour
- Identify traces needing renewal; validate policy and topology scopes.
- Re-attest recognitions, prune obsolete links, and persist updated trace
  snapshots.
- Emit [`FailureCarrier`](../../../../../documents/articles/notes/failure-carrier.md) on
  inconsistencies or policy violations.

## Invariants
- Renewed traces remain consistent and traceable to acts/specs.
- Policy and placement constraints are respected.
- Failures are captured as failure carriers.

## Proof
Refines [WiringPlan](../../../../../documents/articles/notes/wiring-plan.md) by specialising to
trace renewal wiring, preserving kernel semantics and failure handling.
