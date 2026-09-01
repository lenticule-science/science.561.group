---
name: friction-note
description: An observed gap or pain point — incoming-stream observation awaiting triage.
specializing: work-item
narrowing-has-kind: friction-note
---

A **friction-note** is a work-item whose has-kind cell carries the value "friction-note".
Friction-notes have a narrow lifecycle: {open, triaged, withdrawn}.
Triaging-a-friction-note converts it into a task, question, or expedition.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), friction-note specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "friction-note".
