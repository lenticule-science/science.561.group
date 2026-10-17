---
name: milestone
description: A delivery checkpoint within a campaign — a concrete deliverable target.
specializing: work-item
narrowing-has-kind: milestone
---

A **milestone** is a work-item whose has-kind cell carries the value "milestone".
Milestones contribute-to campaigns; goals contribute-to milestones.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), milestone specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "milestone".
