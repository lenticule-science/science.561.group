---
id: flatfile-agential-resource-system-idea
description: "A FlatfileAgentialResourceSystemIdea is an open term — a potential OperationItem with unresolved metavariables (unspecified action, unknown blocker, or unestablished priority) that cannot yet be closed into a ground, committed work item."
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  action-metavariable: relational-universe
  blocker-metavariable: relational-universe
  priority-metavariable: relational-universe
output: relational-universe
ast:
  open-term-work-item:
    - action-metavariable:
        - unresolved-hole
    - blocker-metavariable:
        - unresolved-hole
    - priority-metavariable:
        - unresolved-hole
title: Flatfile Agential Resource System Idea
---

# Flatfile Agential Resource System Idea

## What this is

A **FlatfileAgentialResourceSystemIdea** is an open term: a potential work item with unresolved metavariables.

The mathematical invariant comes from the theory of free algebras and proof assistants.
In Agda, Coq, and Lean, an **open term** (or **term with holes**) is an expression that is well-typed but not yet fully elaborated — it contains metavariables ?m that must be resolved before the term becomes a ground, closed expression.
A term with holes is a partial specification: it names what is being built without fully determining it.

A FlatfileAgentialResourceSystemIdea is exactly this: a potential [OperationItem](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/operation-item.md) with metavariables left open.
The metavariables are:

- **Action**: the specific thing to do — may be unclear ("something about the nucleus spec")
- **Blocker**: a dependency that must be resolved before the action becomes available
- **Priority**: whether the work is worth committing to now

When all metavariables are resolved — the action is clear, no blocker prevents it, and it is worth doing now — the open term **closes** into a ground OperationItem and is promoted to PLANS.md.
The FlatfileAgentialResourceSystemIdea entry is deleted: the ground term (OperationItem) is the record.

This parallels the [WorkUnit](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-unit.md) / template distinction: a WorkUnit is a ground term in T(Σ, ∅); a skill template is an open term in T(Σ, X).
An OperationItem is a ground work item; a FlatfileAgentialResourceSystemIdea is the open term it was before elaboration.

## Status lifecycle

Status names the state of the open metavariables:

- **active** — metavariables are resolvable with current information; can be closed soon
- **blocked** — a specific external fact must become true before the action metavariable can be filled
- **deferred** — resolvable but judged not worth closing now; the blocker is priority

```
active   → (improvement skill closes it to OperationItem; entry deleted)
blocked  → active    (blocker is resolved)
active   → deferred  (judgment: not worth committing now)
```

## Required fields

Every FlatfileAgentialResourceSystemIdea MUST have:

- **An identifier**: kebab-case name unique within the locale's idea store
- **A title**: noun phrase naming what the FlatfileAgentialResourceSystemIdea is about
- **Status**: exactly one of `active`, `blocked`, or `deferred`
- **Problem**: one to three sentences on the gap or issue — what is wrong or missing
- **Approach**: one paragraph on what would address the problem

A FlatfileAgentialResourceSystemIdea with `**Status:** blocked` MUST also have:

- **Blocker**: one sentence naming what must become true before the action metavariable resolves

## What belongs in IDEAS.md

A FlatfileAgentialResourceSystemIdea is appropriate when: a concept is identified as missing but the spec cannot yet be written; a potential improvement is noticed but is not urgent; a Message was triaged as not yet actionable.

A FlatfileAgentialResourceSystemIdea is NOT appropriate for: something with a clear action that can be done now (use an OperationItem); a settled fact (use a MemoryEntry); an incoming communication (use a Message and triage it).

## Open questions

- Whether the three metavariables (action, blocker, priority) fully characterize the open-ness of a FlatfileAgentialResourceSystemIdea or whether additional holes are possible.
