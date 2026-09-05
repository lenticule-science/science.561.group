---
name: getting
description: The act of reading a value from the repo without side effect. The most basic non-trivial transformer in the repo's operative vocabulary; the read of the read-vs-write distinction.
status: draft
---

**Getting** is the act of reading a value out of the repo. A getter receives the value at a specified address; the repo is unchanged by the act.

It is the repo's most basic non-trivial transformer. Trivial transformers would be identity-like: do nothing, return what you were given. Getting does something — addressing, lookup, retrieval — but adds no new evidence. It is what makes the read side of the read-vs-write distinction exist as an act rather than as a passive condition.

## Why getting is foundational

The repo is a predication-graph store. Every operation on it is either a *read* (a getting) or a *write* (a [positing](positing.md) or some derived act). Every doing-act in the repo's eventual machinery is a composition of reads and writes. Reads precede writes (you read inputs before writing outputs); reads outlast writes (you can read what was written, repeatedly, after the write completes); reads underpin verification (postcondition checking is reading).

A skill that gets is a skill that retrieves. A skill that writes is a skill that mutates. Most skills compose both: read input cells, compute, write output cells, witness the act. The retrieval phase is `getting`.

## What getting does NOT do

- **Getting does not change cell values.** A cell whose value is read out is unchanged by the read.
- **Getting does not establish a new predication.** Reading a cell does not assert anything not already asserted in the repo.
- **Getting is not [positing](positing.md).** Positing places evidence into a cell; getting reads what is there.
- **Getting is not the same as `finding`.** [Finding](finding.md) typically connotes search — locating something whose address is not initially known. Getting addresses by known coordinates and retrieves directly.

## In the naming grammar

The transformer's verb is `get`. Its gerund form `getting` heads skill names. Its agent-noun form `getter` heads agent names. Skills built on `getting` include `getting-the-current-time` (the smoke-test exercises this), `getting-a-predication-cell` (retrieves a cell by its coordinates), and others as the repo's apparatus grows.

A `getter-of-X` agent runs skills that retrieve instances of `X`. The agent's role is read-only; its skill chain is read-only; its witnesses record reads but do not alter the repo's content.
