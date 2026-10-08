---
title: Directed Path
id: directed-path
role: structure
status: plan
proof_refs: []
derives-from: math/acts/loop-hit
description: Carrier of directed paths between recognitions/contexts, earned from the loop act; forms the morphisms for the fundamental groupoid.
---



Carrier of directed paths between recognitions/contexts, earned from the loop
act; forms the morphisms for the fundamental groupoid.

## Definition
- Carrier: tuples `(source, target, homotopy_class)` where source/target are
  earned recognitions/contexts (from [Recognition Carrier](./recognition.md))
  and the homotopy class is traced by the
  [LoopHIT](./loop-hit.md) act.
- Structure: source/target projections; reversal is generally not available
  (directed).

## Invariants
- Source/target are stable recognitions.
- Homotopies respect the directed flow; reversal may not exist.
- Composition domain: paths compose only when target of the first equals source
  of the second.

## Proof
- Derived from: [LoopHIT](./loop-hit.md), which earns loops and directed
  path identifications.
- Uses: [Recognition Carrier](./recognition.md) as endpoints.
- Shows that: directed paths form a carrier for composing flows/proofs and
  serve as morphisms in the fundamental groupoid.
