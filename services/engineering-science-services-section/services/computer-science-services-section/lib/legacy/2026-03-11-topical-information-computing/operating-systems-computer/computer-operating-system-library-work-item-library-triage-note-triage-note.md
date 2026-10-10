---
name: triage-note
description: An incoming item awaiting routing — the inbox kind from which work-items are extracted.
specializing: work-item
narrowing-has-kind: triage-note
---

A **triage-note** is a work-item whose has-kind cell carries the value "triage-note".
Triage-notes have the same narrow lifecycle as friction-notes: {open, triaged, withdrawn}.
Processing-a-triage-note classifies and routes.

Per [the work-item-as-predication-shape derivation](../../../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/bootstrapping-the-workflow-library/study-notes/work-item-as-predication-shape.md), triage-note specializes [work-item](../../work-item.md) via predicate-specialization with the sub-support inclusion restricting to entities whose (e, has-kind, k) cell has k = "triage-note".
