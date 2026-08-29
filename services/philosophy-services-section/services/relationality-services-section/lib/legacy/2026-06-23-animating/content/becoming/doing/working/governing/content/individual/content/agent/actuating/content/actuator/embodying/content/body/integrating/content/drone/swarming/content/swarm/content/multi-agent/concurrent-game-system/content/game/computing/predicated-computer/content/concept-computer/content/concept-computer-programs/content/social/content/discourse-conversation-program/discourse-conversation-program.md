---
title: Discourse and Conversation Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---
# Discourse and Conversation Program

This program models speech acts, discourse relations, and conversational
structure so the machine can track what people *do* with language.

## Behaviour

- Recognise turns, adjacency pairs, presuppositions, implicatures, and RST-like
  discourse relations as structured recognitions.
- Trace conversations as sequences of turns with participants, topics, and
  phases (opening, body, closing), keeping provenance for later analysis.
- Measure balance of speech acts, repair and acknowledgment patterns, and
  conversational equity (who is interrupted or ignored).

## Intended operators

- Annotate logs to produce speech-act and discourse-relation recognitions.
- Analyse conversation dynamics to surface control of the floor and breakdowns.
- Feed measurements to governance/support programs that depend on discourse
  health.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

