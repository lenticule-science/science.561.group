---
title: Universe Lowering
id: universe-lowering
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---



Maps a recognition in the recognition universe down to a base-level recognition
via nucleus collapse.

## Definition
- Inputs: recognition-of-recognition in the [Recognition Universe](./recognition-universe.md).
- Output: base [Recognition Carrier](./recognition.md)
  element representing its semantics.
- Behaviour: apply [Nucleus](nucleus.md) to collapse higher-order structure to
  base-level recognition.

## Invariants
- Soundness: lowering preserves meaning; removes higher-order packaging.
- Idempotent: repeated lowering yields same base recognition.

## Proof
- Uses: recognition universe and nucleus.
- Produces: base recognition.
- Shows that: universe elements can be coherently lowered to base recognitions.
