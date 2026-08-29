---
title: Proof Trace
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Captures derivational history of recognitions as path-like witnesses for
inference steps.

## Definition
- Carrier: sequences of inference steps/recognitions arranged in a
  [Trace Shuffle Class](trace-shuffle-class.md), annotated with derived
  recognitions.
- Structure: supports composition, restriction, and shuffle equivalence.

## Invariants
- Causality: proof steps respect dependency ordering.
- Stability: nucleus-equivalent proofs yield equivalent proof traces.

## Proof
- Uses: trace structure and recognition annotations to encode derivations.
- Shows that: inference histories can be treated as traces for analysis and
  replay.
