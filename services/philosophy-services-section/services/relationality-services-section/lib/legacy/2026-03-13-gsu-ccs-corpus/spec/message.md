---
id: message
description: >
  A Message is a structured inter-department communication written to a
  department's INBOX.md. It carries a finding from one department to another
  with enough context for the receiving agent to act without asking.
defines: Message
---

# Message

*Spec-domain object*

## What it is

A Message is the atomic element of a department's `INBOX.md`. It is written
by `skills/deposit-message-in-agent-inbox.md` and read by the receiving department's
improvement skill during the Orientation phase (before PLANS.md is read). A
Message is not a WorkItem — it becomes a WorkItem only after the receiving
agent has triaged it and judged it actionable.

No agent MAY write directly to another department's `INBOX.md` except through
`skills/deposit-message-in-agent-inbox.md`. This ensures all Messages have the
correct format and that the sending department records that the message was
sent.

## Required fields

Every Message MUST have:

- **From**: the sending department (`math`, `proof`, `spec`, `src`, or `root`)
- **Date**: ISO 8601 date (YYYY-MM-DD)
- **Type**: exactly one of `FixNeeded`, `GapFound`, or `Discovery`
- **Subject**: one sentence naming the finding
- **Urgency**: exactly one of `Blocking`, `Normal`, or `Low`
- **Status**: exactly one of `unread`, `acknowledged`, `deferred`, `declined`
- **Body**: full context — enough that the receiving agent can act without
  reading the sender's files

## Type semantics

| Type | Meaning |
|------|---------|
| `FixNeeded` | A specific file or artifact is wrong and needs a specific change |
| `GapFound` | A concept, spec, or skill is missing and needs to be created |
| `Discovery` | Something interesting was learned that the department should know |

## Canonical format

```markdown
### Message
- from: {department}
- date: {YYYY-MM-DD}
- type: {FixNeeded|GapFound|Discovery}
- urgency: {Blocking|Normal|Low}
- subject: {one sentence}
- status: unread

{body: full context, as many paragraphs as needed}
```

## Status lifecycle

```
unread → acknowledged   (improvement skill decides this is a WorkItem; adds to PLANS)
unread → deferred       (improvement skill decides not yet actionable; moves to IDEAS)
unread → declined       (improvement skill decides irrelevant; records reason)
```

A Message MUST NOT remain `unread` after the improvement skill has run its
Orientation phase. Every Message MUST be given a status before PLANS.md is
read.

When a Message is `acknowledged`, the improvement skill MUST add a WorkItem to
`PLANS.md` that addresses the Message's subject. The WorkItem's **Why:**
SHOULD reference the Message.

When a Message is `declined`, the improvement skill MUST append a one-sentence
reason to the Message body (e.g., "Declined: this is owned by proof/, not
spec/").

## Relationship to other types

- Messages are written by: `skills/deposit-message-in-agent-inbox.md`
- Messages are read by: the improvement skill during Orientation (Step 2 of
  `spec/skills/improve-specs.md`)
- An `acknowledged` Message produces a WorkItem (§work-item)
- A `deferred` Message produces an Idea (§idea)
- A `declined` Message produces nothing — it is archived in place

## Pending

- No mechanism for a Message to reference specific file line numbers or anchors.
  May be needed once the knowledge graph is operational.
