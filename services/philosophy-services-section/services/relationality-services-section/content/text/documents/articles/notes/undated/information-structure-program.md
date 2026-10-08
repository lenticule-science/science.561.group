---
title: Information Structure Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program models topic and focus so the machine can see what is presented as given versus new or emphasized in an utterance.
---

This program models topic and focus so the machine can see what is presented as
given versus new or emphasized in an utterance.

## Behaviour

- Represent topics, foci, and given/new partitions as recognitions with links
  to the entities and contrasts involved.
- Track how sources topicalize the same events differently and how focus shifts
  across conversations or news cycles.
- Measure which recognitions repeatedly appear as topic versus focus, and where
  content is consistently de-focused or backgrounded.

## Intended operators

- Annotate text or speech for information-structure elements.
- Compare topicalization across sources for the same event.
- Guide agents to choose appropriate focus for a goal and audience.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
