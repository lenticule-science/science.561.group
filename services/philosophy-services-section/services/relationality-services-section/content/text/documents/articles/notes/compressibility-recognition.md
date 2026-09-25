---
title: Compressibility Recognition
id: compressibility-recognition
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Recognises whether a trace can be simplified under shuffle/nucleus without loss.
---



Recognises whether a trace can be simplified under shuffle/nucleus without loss.

## Definition
- Inputs: a [Trace Shuffle Class](./trace-shuffle-class.md).
- Output: recognition indicating compressibility/incompressibility.
- Behaviour: attempt to reduce the trace via shuffle equivalences and nucleus;
  if equivalent shorter trace exists, mark as compressible.

## Invariants
- Soundness: only truly reducible traces are marked compressible.
- Monotonicity: adding more steps cannot make an incompressible trace
  compressible without additional equivalences.

## Proof
- Uses: [Trace Shuffle Class](./trace-shuffle-class.md) to explore
  equivalences.
- Produces: [Recognition Carrier](./recognition.md) marker.
- Shows that: compressibility is recognisable within the earned trace/shuffle
  structure.

## Earlier material

## Proof
- Uses: [Trace Shuffle Class](trace-shuffle-class.md) to explore
  equivalences.
- Produces: [Recognition Carrier](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/recognition.md) marker.
- Shows that: compressibility is recognisable within the earned trace/shuffle
  structure.
