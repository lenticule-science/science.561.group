---
title: Phonology and Prosody Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program models phonological and prosodic structure as recognitions to support speech analysis and generation.
---

This program models phonological and prosodic structure as recognitions to
support speech analysis and generation.

## Behaviour

- Represent segments, features, syllables, stress, tone, and intonation as
  recognitions with provenance.
- Link phonology/prosody to higher-level linguistic structures and modalities.
- Measure pronunciation variation, prosodic patterns, and alignment with
  meaning/pragmatics.

## Intended operators

- Annotate speech for phonological/prosodic structure.
- Generate or adapt prosody for synthesis with traceable constraints.
- Compare patterns across languages, registers, or speakers.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
