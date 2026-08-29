---
name: unit

description: "Base type for all atomic entries in department context files: Principle, MemoryEntry, Message, WorkItem, and Idea."
defines: Unit
---

## What it is

A Unit is the smallest indivisible entry in a department context file. Each context
file is a sequence of Units of a single type:

| File | Unit type | Spec |
|------|-----------|------|
| `SOUL.md` | Principle | §principle |
| `MEMORY.md` | MemoryEntry | §memory-entry |
| `INBOX.md` | Message | §message |
| `PLANS.md` | WorkItem | §work-item |
| `IDEAS.md` | Idea | §idea |

A Unit is identified by its position in its file and by the type-specific identifier
field (e.g., `### WI-3:` for WorkItems, `### I-2:` for Ideas). `SOUL.md` and
`MEMORY.md` entries are identified by their heading text, not a numeric id.

## What every Unit has

Every Unit MUST have:

- **A heading** that identifies it uniquely within its file
- **A body** containing at least the required fields of its concrete type

Every Unit MAY have:

- **A status field** — required for WorkItem and Idea; optional or absent for
  Principle and MemoryEntry
- **A why field** — provenance or motivation

## MUST constraints

A Unit MUST NOT encode information that is derivable from its position, filename,
or structural context. Examples of derivable information that MUST NOT be hardcoded:

- The department a Unit belongs to (derivable from its file's path)
- The Unit's type (derivable from which file it is in)
- The numeric sequence position of an id (derivable by counting existing ids in the file)

Redundant encoding is a compliance violation. It creates two sources of truth that
can diverge; when they diverge, there is no rule for resolving the conflict.

## Concrete types

See the individual type specs for required fields and canonical format:

- §principle — a stable constraint on department behavior
- §memory-entry — a dated learned fact; append-only
- §message — an inter-department communication; has lifecycle status
- §work-item — a committed actionable task; has lifecycle status
- §idea — an uncommitted potential work item; has lifecycle status

## Pending

- A formal schema for Unit (e.g., a Pydantic base class) does not yet exist in
  `src/`. Once `src/read/markdown.py` can parse context files, each Unit type
  should have a corresponding Pydantic model and a derivation script in
  `src/derive/` that computes any derivable fields from parsed input.
  Blocked by: src/ derivation architecture (see root IDEAS.md).
