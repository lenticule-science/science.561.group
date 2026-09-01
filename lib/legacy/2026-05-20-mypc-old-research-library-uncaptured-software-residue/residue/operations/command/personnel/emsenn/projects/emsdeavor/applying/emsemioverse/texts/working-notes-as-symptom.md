---
title: "Working notes as symptom"
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
type: text
keywords:
  - Emsemioverse
  - Governance
  - ProjectManagement
description: "The existence of a 44K working-notes.md file indicates missing governance, planning, and implementation infrastructure."
---

The existence of a large working-notes.md file is a symptom of
missing infrastructure, not a solution to the problem of
cross-session continuity.

## What working-notes.md does

`working-notes.md` accumulates session state: what was done, what
needs doing, what context the next session needs. Over time it grows
to tens of thousands of words of accumulated context — task lists,
research findings, design decisions, implementation notes, all
interleaved.

## Why this is a problem

A 44K working-notes file means:

- **Plans aren't carrying the load.** If plans tracked work
  properly, working notes wouldn't need to describe what's in
  progress or what comes next.
- **Decisions aren't being recorded.** If decision records captured
  the rationale behind choices, working notes wouldn't need to
  explain why things are the way they are.
- **The encoding loop isn't running.** If insights from
  conversations were encoded as proper content (terms, concepts,
  texts), working notes wouldn't need to preserve them as raw
  session transcripts.
- **TODO.md isn't being maintained.** If the TODO file tracked
  active, ready, and unplanned work, working notes wouldn't need
  task lists.

## What working-notes.md should be

Working notes should be thin — a few lines pointing to the active
plan, noting any session-specific context that doesn't belong in a
plan (e.g., "emsenn is frustrated about X, don't repeat that
mistake"), and nothing else.

Everything currently in working notes should live somewhere else:
- Task descriptions → TODO.md and plan files
- Design decisions → decision records
- Research findings → texts in the appropriate discipline
- Implementation notes → plan log sections
- Context for next session → the plan's current state IS the context

## Source

This text captures emsenn's observation from 2026-03-07: "Having a
working-notes.md file seems like an indication we're missing huge
chunks of actual governance, planning, and implementation
infrastructure."
