---
name: decision
description: A recorded answer to a question — an ADR-shaped record with date, context, decision, consequences.
specializing: work-item
narrowing-has-kind: decision
---

A **decision** is a work-item whose has-kind cell carries the value "decision".
Decisions are immutable once recorded; they may be superseded by later decisions but not edited.
The has-status cell takes values from {pending, recorded, superseded}.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), decision specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "decision".
