---
title: Union Window
role: operator
inputs:
- id: hypertensor-window
  alias: left
- id: hypertensor-window
  alias: right
outputs:
- id: hypertensor-window
  alias: window
transformation:
- return
  - window
proof_refs:
- hypertensor-window
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Computes the union/covering window of two hypertensor windows when admissible.

## Proof
- Uses: hypertensor coverage rules to form a joint cover.
- Shows that: windows can be combined when coverage admits their union.
