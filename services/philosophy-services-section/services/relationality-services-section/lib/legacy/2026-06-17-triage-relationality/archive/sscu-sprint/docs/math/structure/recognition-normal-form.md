---
title: Recognition Normal Form
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Canonical representative of a recognition obtained by collapsing via nucleus and
logical simplification; enables deterministic comparison/hashing.

## Definition
- Representative: element of the [Recognition Carrier](recognition.md)
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
