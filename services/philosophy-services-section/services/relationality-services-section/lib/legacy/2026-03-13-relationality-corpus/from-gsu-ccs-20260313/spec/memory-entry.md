---
name: memory-entry

description: >
  A MemoryEntry is a dated factual note in a department's MEMORY.md that
  captures something learned which should inform all future work in that
  department. It is append-only: entries are never deleted, only superseded.
defines: MemoryEntry
---

*Spec-domain object*

## What it is

A MemoryEntry is the atomic element of a department's `MEMORY.md`. It records
a fact, pattern, or decision that was non-obvious enough to be worth writing
down, and stable enough to be useful across sessions. MemoryEntries are not
plans (those are WorkItems in `PLANS.md`), not ideas (those are Ideas in
`IDEAS.md`), and not incoming communications (those are Messages in `INBOX.md`).

`MEMORY.md` is agent-written, not human-written. The improvement skill writes
MemoryEntries through `skills/post-work-update.md` when it learns something
worth persisting. Humans may read it but SHOULD NOT add entries manually —
that is a sign the information belongs somewhere else (a spec file, the
PLANS, or the SOUL).

## Required fields

Every MemoryEntry MUST have:

- **Date**: ISO 8601 date (YYYY-MM-DD)
- **Topic**: a short noun phrase naming what the entry is about
- **Fact**: one to four sentences stating what was learned and what it implies

## Canonical format

```markdown
## {YYYY-MM-DD} — {topic}

{fact: one to four sentences. may include one implication.}
```

## Lifecycle

MemoryEntries that become false or outdated SHOULD be superseded: add a new
entry with the correction and a note of what it replaces, then delete the old
one. Do not accumulate stale entries — MEMORY.md is operational context, not
an archive.

Session summaries and task logs are NOT MemoryEntries and SHOULD NOT be written
there at all. If a wind-down writes a session summary to MEMORY.md, that is a
bug in the wind-down, not a MemoryEntry.

## What belongs in MEMORY.md

The test: would this entry help a future agent *behave differently* than it
would by default? If not, don't write it.

**Appropriate:**
- Behavioral observations about the user or collaboration: "user gets frustrated
  when agents lose sight of big-picture goals; proactively reorient toward
  them" — this is not in git, not in plans, and changes how you work
- Interaction patterns that were non-obvious: "user's corrections often target
  the frame, not the content — read the meta-message before responding"
- Naming or terminology decisions that might otherwise be relitigated
- A constraint discovered that is not yet captured in any spec
- A compliance rule established or changed

**Not appropriate — use something else instead:**
- Session summaries ("we built X, Y, Z today") — this is in git; read the log
- What work is pending — that is in PLANS.md
- What was recently completed — that is in git history
- Things that belong in a spec file — write the spec
- Things already in AGENTS.md or SOUL.md — don't duplicate
- Tooling notes or build commands — belong in README or AGENTS.md

The distinction: PLANS.md tracks *what to do*. Git tracks *what happened*.
MEMORY.md tracks *how to work with this person and this codebase* in ways
that are not recoverable from either of those sources.

## Loading constraints

`MEMORY.md` is loaded at the start of every improvement skill session.
It MUST remain concise enough to be useful as in-context memory. When
`MEMORY.md` approaches 50 entries, the improvement skill SHOULD review it
for entries that have been fully absorbed into spec files and are redundant.
Such entries MAY be compressed (multiple entries on the same topic collapsed
into one) but MUST NOT be deleted without a superseding entry.

## Relationship to other types

- MemoryEntries are written by: `skills/post-work-update.md` (via the
  improvement skill loop) and `skills/deposit-message-in-agent-inbox.md` when
  the sender records that a message was sent.
- MemoryEntries are read by: any skill that reads MEMORY.md at session start.
- When a MemoryEntry records a pattern or gap that is now understood well
  enough to act on, the improvement skill SHOULD promote it to a WorkItem
  (§work-item) or a spec file and note the promotion in a new MemoryEntry.
