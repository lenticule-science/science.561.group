---
title: Hypertensor Window
id: hypertensor-window
role: structure
status: plan
emerges_from: decompose-trace
proof_refs:
- decompose-trace
fields:
- name: window
  type: trace
  description: lattice window identifier extracted from trace decomposition.
- name: fiber
  type: hypertensor-fiber
  description: fibre data over the window.
- name: tower
  type: hypertensor-tower
  description: tower index capturing nested windows.
fields:
- name: window
  type: trace
  description: lattice window identifier with admissible coordinates.
- name: fiber
  type: hypertensor-fiber
  description: fiber data over the window.
- name: tower
  type: hypertensor-tower
  description: tower index capturing nested windows.
---


# Hypertensor Window

## Statement

There exists a single lattice window carrier

```text
Window
```

earned by trace decomposition/shuffle and fixed-point acts, subject to the
quasicrystalline constraints.

## Construction by acts

- [`decompose-trace`](./decompose-trace.md),
  [`shuffle-trace`](./shuffle-trace.md), and
  [`collapse-shuffle`](./collapse-shuffle.md) extract lattice windows from
  traces.
- [`ensure-fixed-point`](./ensure-fixed-point.md) fixes the substitution
  flow, yielding a stable window basis.
- External quasicrystal constraints from
  [`reference/quasicrystalline-relational-hypertensors`](../../../../../../../content/text/documents/articles/notes/undated/quasicrystalline-relational-hypertensors.md)
  restrict admissible windows.

## Uniqueness

Given these acts and constraints, any earned window carrier is
nucleus-equivalent; `Window` is unique up to earned equivalence.

## Proof
- Uses: acts [Decompose Trace](./decompose-trace.md),
  [Shuffle Trace](./shuffle-trace.md), [Collapse Shuffle](./collapse-shuffle.md),
  and [Ensure Fixed Point](./ensure-fixed-point.md) to extract stable
  windows plus quasicrystalline constraints on admissible coordinates.
- Shows that: the window/fiber/tower trio is earned from trace decomposition
  and fixed-point discipline; no unearned fields are added.
