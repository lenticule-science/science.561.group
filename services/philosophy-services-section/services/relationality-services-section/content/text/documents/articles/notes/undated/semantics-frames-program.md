---
title: Semantics Frames Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program models frame semantics as recognitions so roles and fillers are explicit and traceable.
---

This program models frame semantics as recognitions so roles and fillers are
explicit and traceable.

## Behaviour

- Represent frames, roles, and frame elements as recognitions with provenance.
- Link frames to lexical units, domains, and discourse contexts.
- Measure frame usage, ambiguity, and shifts across domains.

## Intended operators

- Annotate text for frames and roles.
- Query and compare frame usage across corpora or domains.
- Support generation/translation with frame-aware constraints.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
