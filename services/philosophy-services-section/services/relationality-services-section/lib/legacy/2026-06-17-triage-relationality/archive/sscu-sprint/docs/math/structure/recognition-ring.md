---
title: Recognition Ring
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Ring-like algebra of recognitions under merge/addition and convolution
multiplication.

## Definition
- Carrier: [Recognition Carrier](recognition.md) equipped with:
  - Addition/merge: join/meet-based combination of recognitions.
  - Multiplication: [Recognition Convolution](../operator/recognition-convolution.md).
- Structure: distributivity of convolution over merge where admissible.

## Invariants
- Associativity/commutativity for addition; associativity for convolution up to
  nucleus; distributivity where flows compose.
- Identities: neutral recognition for addition; identity recognition if
  available for convolution.

## Proof
- Uses: recognition lattice for additive structure and convolution operator for
  multiplicative structure.
- Shows that: recognitions form a ring-like algebra compatible with flow/nucleus
  semantics.
