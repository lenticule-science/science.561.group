---
name: goal
description: An outcome statement beneath a milestone. Goals decompose a milestone into discrete outcomes that contributions can target.
specializing: work-item
narrowing-has-kind: goal
---

A **goal** is a work-item whose has-kind cell carries the value "goal".
A goal's contributes-to cell points at a milestone (required); tasks contribute-to goals.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), goal specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "goal".
