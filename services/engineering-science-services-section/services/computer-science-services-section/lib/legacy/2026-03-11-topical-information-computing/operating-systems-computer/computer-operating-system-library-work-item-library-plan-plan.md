---
name: plan
description: A sequenced collection of work-items — the ordered execution path for a project or campaign.
specializing: work-item
narrowing-has-kind: plan
---

A **plan** is a work-item whose has-kind cell carries the value "plan".
A plan's library subdir holds its constituent phases; phases hold tasks.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), plan specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "plan".
