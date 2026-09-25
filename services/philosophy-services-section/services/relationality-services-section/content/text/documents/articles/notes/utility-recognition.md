---
title: Utility Recognition
id: utility-recognition
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Recognises the “goodness” or desirability of states for an agent as a recognition-valued utility.
---



Recognises the “goodness” or desirability of states for an agent as a
recognition-valued utility.

## Definition
- Inputs: an [Agent](./agent.md) and a recognition/state candidate.
- Output: recognition reflecting agent-specific utility (not numeric).
- Behaviour: evaluate the state against the agent’s norms/epistemics and encode
  desirability as a recognition in the logic lattice.

## Invariants
- Contextual: utility depends on agent’s current epistemic/norm state.
- Monotone: improving compliance/knowledge raises utility recognition.

## Proof
- Uses: [Agent](./agent.md) and [Recognition Carrier](./recognition.md).
- Produces: utility-valued [Recognition Carrier](./recognition.md) element.
- Shows that: utility can be represented recognitionally for strategic updates.

## Earlier material

## Proof
- Uses: [Agent](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/agent.md) and [Recognition Carrier](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/recognition.md).
- Produces: utility-valued [Recognition Carrier](../../../../../../logic-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predicate-set/library/predicate-category/hacking/library/object/library/thing/library/category/hacking/library/information/library/recognition/structure/recognition.md) element.
- Shows that: utility can be represented recognitionally for strategic updates.
