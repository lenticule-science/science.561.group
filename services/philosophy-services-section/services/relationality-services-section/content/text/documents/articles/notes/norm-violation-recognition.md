---
title: Norm Violation Recognition
id: norm-violation-recognition
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Detects when a recognition violates a norm regime and emits a violation witness or neutral element if compliant.
---



Detects when a recognition violates a norm regime and emits a violation witness
or neutral element if compliant.

## Definition
- Inputs: a [Norm Regime](./norm-regime.md) and a recognition in the
  [Recognition Carrier](./recognition.md).
- Outputs: recognition of violation (or neutral if compliant).
- Behaviour: evaluate the recognition against the regime’s admissibility
  predicate; if outside, return a violation recognition (e.g., bottom or tagged
  violation); otherwise return neutral/top.

## Invariants
- Soundness: compliant recognitions do not yield violation; violators always
  yield violation.
- Monotonicity: tightening the regime cannot turn a violation into compliance.
- Compatibility: interacts with flow/nucleus so violations remain violations
  under evolution.

## Proof
- Uses: [Norm Regime](./norm-regime.md) as policy, and
  [Recognition Carrier](./recognition.md) as domain/codomain.
- Produces: [Recognition Carrier](./recognition.md) marking
  violation.
- Shows that: normative predicates can be expressed as recognition operations
  consistent with earned lattice/logic structure.

## Earlier material

## Definition
- Inputs: a [Norm Regime](norm-regime.md) and a recognition in the
  [Recognition Carrier](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/recognition.md).
- Outputs: recognition of violation (or neutral if compliant).
- Behaviour: evaluate the recognition against the regime’s admissibility
  predicate; if outside, return a violation recognition (e.g., bottom or tagged
  violation); otherwise return neutral/top.

## Proof
- Uses: [Norm Regime](norm-regime.md) as policy, and
  [Recognition Carrier](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/recognition.md) as domain/codomain.
- Produces: [Recognition Carrier](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/recognition.md) marking
  violation.
- Shows that: normative predicates can be expressed as recognition operations
  consistent with earned lattice/logic structure.
