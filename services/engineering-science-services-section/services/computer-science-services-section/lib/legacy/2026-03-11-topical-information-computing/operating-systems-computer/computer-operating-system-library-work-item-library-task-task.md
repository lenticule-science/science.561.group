---
name: task
description: An atomic executable unit of work — the most concrete work-item kind. Tasks may contribute-to goals/milestones/campaigns but other work-items do not contribute-to tasks.
specializing: work-item
narrowing-has-kind: task
---

A **task** is a work-item whose has-kind cell carries the value "task".
Tasks are leaf nodes in the work hierarchy.
A task's lifecycle uses the full 8-state state-machine.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), task specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "task".
