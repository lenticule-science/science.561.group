---
title: Path Compose Addressed
id: path-compose-addressed
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Path composition with explicit addressing of subwindows/subsections (region selection).
---



Path composition with explicit addressing of subwindows/subsections (region selection).

## Definition
- Inputs: two composable paths in [Directed Path](./directed-path.md)
  with explicit source/target [Hypertensor Windows](./hypertensor-window.md) (subwindows/subsections).
- Output: composed path with region/address metadata preserved.
- Behaviour: ensure endpoints match at the addressed regions; compose via
  [Path Compose](./path-compose.md).

## Invariants
- Region correctness: composition valid only when regions align.
- Address preservation: resulting path retains addressing info for further ops.

## Proof
- Uses: addressed window data and path composition.
- Produces: composed directed path.
- Shows that: path composition can be region-aware to mirror machine addressing.
