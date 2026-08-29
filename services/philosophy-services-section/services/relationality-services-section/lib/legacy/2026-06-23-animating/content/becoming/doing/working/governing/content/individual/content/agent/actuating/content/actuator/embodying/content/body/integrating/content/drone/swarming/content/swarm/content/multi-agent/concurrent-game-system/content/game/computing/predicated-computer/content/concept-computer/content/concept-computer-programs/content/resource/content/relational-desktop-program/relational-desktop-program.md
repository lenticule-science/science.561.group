---
title: Relational Desktop Program
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
# Relational Desktop Program

This program presents the relational computer as a desktop environment where
files, windows, and actions are recognitions.

## Behaviour

- Represent desktop objects (files, views, shortcuts), sessions, and layouts as
  recognitions with provenance.
- Bind GUI actions to underlying recognitions and runbooks; avoid hidden state.
- Measure usage, performance, and workspace health.

## Intended operators

- Render and manipulate desktop objects via recognitions.
- Persist and restore sessions and layouts with trace.
- Audit actions and surface gaps to refine the desktop model.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

