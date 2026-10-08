---
id: flatfile-agential-resource-system-memory-entry
description: "A FlatfileAgentialResourceSystemMemoryEntry is a timestamped fact in a monotonically expansive knowledge base — a dated ground atom that was learned and must inform future agent behavior until explicitly superseded."
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  timestamp: relational-universe
  ground-atom: relational-universe
output: relational-universe
ast:
  monotonic-knowledge-fact:
    - timestamp:
        - iso8601-date
    - ground-atom:
        - closed-proposition
        - behavioral-implication
title: Flatfile Agential Resource System Memory Entry
---

# Flatfile Agential Resource System Memory Entry

## What this is

A **FlatfileAgentialResourceSystemMemoryEntry** is a timestamped fact in a monotonically expansive knowledge base.

The mathematical invariant comes from Datalog and knowledge base theory.
In **Datalog**, a knowledge base is a set of **ground atoms** — predicate applications to constants, with no variables.
The database is the minimal Herbrand model: the least set of ground atoms closed under the rules.
A **fact** (an unconditional ground atom) is added directly to the database without deriving it.

A FlatfileAgentialResourceSystemMemoryEntry is a fact in this sense: a pair **(t, α)** where t is an ISO 8601 date (when the fact was recorded) and α is a ground atom — a proposition about the system, its collaborators, or its behavior that has no free variables and no pending derivation.
It states what is, not what might be or what to do.

The knowledge base is **monotonically expansive**: facts are only added, never retracted.
This is monotonic accumulation — the database grows over time.
This is distinct from non-monotonic reasoning (where conclusions can be withdrawn when new information arrives).
FlatfileAgentialResourceSystemMemoryEntries do not participate in non-monotonic inference; they are unconditional baseline facts.

**Supersession** is the limited exception: when a fact α becomes false, a new entry asserting α′ (the correction) is added, and the old entry α is deleted.
This is not retraction — it is **revision** (in the sense of AGM belief revision: Alchourrón, Gärdenfors, Makinson 1985): add the stronger fact and remove the now-false weaker one.
The superseding entry carries a note of what it replaces.

This distinguishes a FlatfileAgentialResourceSystemMemoryEntry from:

- A **plan** (an OperationItem) — a plan records what to do; a fact records what is
- An **idea** — an idea is an open term awaiting elaboration; a fact is a closed assertion
- A **message** — a message is incoming communication awaiting triage; a fact is settled knowledge
- A **principle** — a principle is a safety invariant □φ over all reachable states; a fact is a contingent assertion that may be revised as the world changes

## Test for inclusion

A FlatfileAgentialResourceSystemMemoryEntry is worth writing iff the ground atom α would cause a future agent to **behave differently** than it would by default.
If the fact is derivable from git history, from spec files, or from AGENTS.md or SOUL.md, it does not need to be asserted in MEMORY.md — it is already in the knowledge base elsewhere.

Appropriate: behavioral observations about collaborators, non-obvious interaction constraints, terminology decisions, constraints not yet captured in any spec.

Not appropriate: session summaries (in git), pending work (in PLANS), completed work (in git), anything that belongs in a spec file.

## Required fields

Every FlatfileAgentialResourceSystemMemoryEntry MUST have:

- **Date**: ISO 8601 date (YYYY-MM-DD) — the transaction time t
- **Topic**: short noun phrase naming what the entry is about
- **Fact**: one to four sentences stating α and what it implies for future behavior

## Lifecycle

When α becomes false: write a new entry α′ with a note of what it replaces, then delete the old entry.
Do not accumulate stale facts — MEMORY.md is a live knowledge base, not an archive.
Session summaries and task logs are NOT ground atoms about the system's behavior; they belong in git.

## Open questions

- Whether the revision operation (supersession) should be recorded explicitly in the new entry (citing the old entry's topic), or whether the note in the Fact field is sufficient.
