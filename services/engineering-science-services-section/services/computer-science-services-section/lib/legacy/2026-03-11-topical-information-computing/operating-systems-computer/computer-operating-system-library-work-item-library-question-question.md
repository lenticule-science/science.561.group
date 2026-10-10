---
name: question
description: A pending decision the operator must answer before downstream work can proceed.
specializing: work-item
narrowing-has-kind: question
---

A **question** is a work-item whose has-kind cell carries the value "question".
Questions are workflow-items but with a narrower has-status state-machine: {open, answered, withdrawn} rather than the full 8-state lifecycle.
A question's resolution is recorded as a decision.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), question specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "question".
