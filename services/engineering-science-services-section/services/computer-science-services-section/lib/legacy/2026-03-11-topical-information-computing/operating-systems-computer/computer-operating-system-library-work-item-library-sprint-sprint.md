---
name: sprint
description: A time-boxed work cycle — fixed duration, fixed scope, retrospective at end.
specializing: work-item
narrowing-has-kind: sprint
---

A **sprint** is a work-item whose has-kind cell carries the value "sprint".
Sprints are temporal containers; their contributes-to cell points at a project, campaign, or plan.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), sprint specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "sprint".
