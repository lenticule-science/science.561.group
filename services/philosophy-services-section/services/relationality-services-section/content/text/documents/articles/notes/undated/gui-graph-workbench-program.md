---
title: GUI Graph Workbench Program
kind: structure
layer: program
status: someday
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
derives-from:
  - computer/structure/computer-kernel
description: This program designs graphical workbenches—graph explorers, dashboards, canvas views—that stay faithful to acts, topology, and measurement.
---

This program designs graphical workbenches—graph explorers, dashboards, canvas
views—that stay faithful to acts, topology, and measurement.

## Behaviour

- Define view workspaces, panels, interactions, and annotations as recognitions
  (no hidden UI state).
- Express projections as queries over recognitions; panels declare what they
  show and how (tables, timelines, graph layouts).
- Record interactions and annotations with provenance so views are auditable.
- Measure coverage (which parts of the graph are visible) and usage/performance
  (panel load times, query durations, interaction frequency).

## Intended operators

- Create workspaces from graph filters and layout templates.
- Attach panels bound to queries; record interactions as events.
- Export views as static documentation to accompany textual specs.

## Proof
- Derived from: [Computer Kernel](../../../../triage/triage/computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.
