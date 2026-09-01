---
id: idea
description: >
  An Idea is an uncommitted potential WorkItem in a department's IDEAS.md.
  It names a gap, improvement, or speculative extension that is not yet ready
  for PLANS.md — because it is blocked, under-specified, or not yet urgent.
---

# Idea

*Spec-domain object*

## What it is

An Idea is the atomic element of a department's `IDEAS.md`. It is raw
unplanned material: something worth tracking that cannot yet be committed to
as a WorkItem. Ideas are mined into PLANS.md by the improvement skill when
their blockers are resolved and their action becomes clear.

An Idea is different from a WorkItem in that it may be vague, speculative, or
blocked — it does not need to be immediately executable. It is different from
a MemoryEntry in that it implies potential future work, not a fact already
settled.

## Required fields

Every Idea MUST have:

- **An identifier**: kebab-case descriptive name, unique within the file.
  Named by what the idea addresses. No numeric schemes.
- **A title**: noun phrase naming what the Idea is about
- **Status**: exactly one of `active`, `blocked`, or `deferred`
- **Problem**: one to three sentences describing the gap or issue the Idea
  addresses — what is wrong or missing, not what to do about it
- **Approach**: one paragraph describing what a spec, skill, or change would
  do to address the problem

An Idea with `**Status:** blocked` MUST also have:

- **Blocker**: one sentence naming what must be true before this can proceed

## Canonical format

```markdown
### {identifier}

**Status:** active | blocked | deferred

**Problem:** one to three sentences naming the gap or issue.

**Approach:** one paragraph on what would address it.

**Blocker:** (required if blocked) what must be resolved first.
```

## Status lifecycle

```
active   → (improvement skill promotes it to PLANS when ready; entry deleted)
blocked  → active    (blocker is resolved)
active   → deferred  (judgment: not worth doing now; note the reason)
```

When an Idea is promoted to a WorkItem in PLANS.md, the Idea entry MUST be
deleted from IDEAS.md. The WorkItem in PLANS.md is the record. Do not replace
the Idea with a "done" stub, strikethrough, or redirect note — that is detritus
(§unit-moves-are-deletions in root SOUL.md).

When a deferred Message from INBOX.md is moved to IDEAS.md, it becomes an Idea
with `**Status:** active` (or `blocked` if a blocker is known). The original
Message in INBOX.md has its status set to `deferred` and is otherwise left
intact — Messages are not deleted, only given a final status.

## What belongs in IDEAS.md

An Idea is appropriate when:
- A concept is identified as missing but the spec cannot yet be written
  (blocked by upstream work)
- A potential improvement is noticed during other work but is not urgent
- A Message was triaged as "not yet actionable" by the improvement skill

An Idea is NOT appropriate for:
- Something with a clear action that can be done now (use a WorkItem)
- A fact already settled (use a MemoryEntry)
- An incoming communication (use a Message; triage it first)

## Relationship to other types

- Ideas are written by: the improvement skill during INBOX triage (deferred
  Messages become Ideas) and during the missing-spec discovery step.
- Ideas are promoted by: the improvement skill when blockers resolve,
  producing WorkItems (§work-item). The Idea is deleted on promotion.
