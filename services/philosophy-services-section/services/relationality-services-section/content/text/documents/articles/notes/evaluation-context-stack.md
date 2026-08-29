---
title: Evaluation Context Stack
id: evaluation-context-stack
role: structure
status: plan
proof_refs:
- evaluation-context
- hypertensor-section
- trace
fields:
- name: head
  type: evaluation-context
  description: top frame to apply next (may be the neutral frame).
- name: tail
  type: evaluation-context-stack
  description: remaining frames after popping the head; empty when stack depth is one.
- name: length
  type: trace
  description: derived depth of the stack.
- name: frames
  type: evaluation-context
  description: ordered list of evaluation-context frames (stack).
---


# Evaluation Context Stack

Stack/continuation structure for evaluating hypertensor sections; models
evaluation contexts as transforms on sections.

## Definition
- Frames: [Evaluation Context](./evaluation-context.md) frames with holes.
- Stack: ordered list of frames; `head` is the current continuation, `tail` the rest.
- Transform: applying the head frame to a [Hypertensor Section](./hypertensor-section.md)
  yields the next section plus possibly updated stack; `length` tracks depth.

## Invariants
- Well-formed: frames compose to a total evaluation on the section.
- Determinism: given a section and stack, the next step is determined by the head frame.
- Preservation: stack manipulation respects admissible flow/nucleus on sections.
- Depth accounting: `length` matches the number of frames; popping/pushing updates head/tail coherently.

## Proof
- Uses: hypertensor sections/windows, flow/nucleus acts, and evaluation-context
  frames to define stack composition and evolution.
- Shows that: evaluation contexts can be represented as a stack of section
  transforms for big/small-step semantics without relying on expression tags.
