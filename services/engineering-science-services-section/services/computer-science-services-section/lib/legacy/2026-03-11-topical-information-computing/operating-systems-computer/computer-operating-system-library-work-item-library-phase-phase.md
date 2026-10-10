---
name: phase
description: A temporal segment of a plan — a coherent sub-period during which a set of work-items advance together.
specializing: work-item
narrowing-has-kind: phase
---

A **phase** is a work-item whose has-kind cell carries the value "phase".
Phases contribute-to plans; tasks and goals contribute-to phases.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), phase specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "phase".
