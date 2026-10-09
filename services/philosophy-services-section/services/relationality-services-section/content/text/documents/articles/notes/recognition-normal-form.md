---
title: Recognition Normal Form
id: recognition-normal-form
role: structure
status: plan
proof_refs: []
description: Canonical representative of a recognition obtained by collapsing via nucleus and logical simplification; enables deterministic comparison/hashing.
---



Canonical representative of a recognition obtained by collapsing via nucleus and
logical simplification; enables deterministic comparison/hashing.

## Definition
- Representative: element of the [Recognition Carrier](./recognition.md)
  reduced by nucleus closure and logical simplification rules (idempotent,
  absorption, De Morgan, implication adjunction).
- Role: unique (up to earned equivalence) form for equality checks and storage.

## Invariants
- Uniqueness up to logical equivalence/nucleus.
- Idempotence: normalising twice yields the same representative.
- Stability: normal forms are closed under nucleus.

## Proof
- Uses: nucleus and logic algebra laws to define normalisation.
- Shows that: recognitions admit canonical forms for deterministic comparison.
