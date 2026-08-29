---

title: "ADR Specification"
date-created: 2026-03-09T00:00:00
introduces: specification
stability: draft
version: [0, 1, 0]
keywords:
  - adr
  - knowledge-governance
description: "Conformance requirements for architectural decision records."
part-of: information/disciplines/knowledge-systems/standards/adr
---

## Normative scope

This specification IS normative about: ADR format and location.
This specification IS NOT normative about: what decisions warrant
an ADR (use judgment — if it would be confusing later without a
record, write one).

## Required fields (frontmatter)

| Field | Requirement |
|-------|-------------|
| `title` | MUST start with "Decision:" |
| `date-created` | MUST be ISO 8601 |
| `authors` | MUST list decision-makers |
| `type` | MUST be `decision` |
| `status` | MUST be one of: `accepted`, `superseded`, `proposed` |

## Required sections (body)

| Section | Contains |
|---------|----------|
| `## Context` | What situation prompted this decision |
| `## Decision` | What was decided, stated directly |
| `## Consequences` | What follows from this decision |
| `## Alternatives considered` | What was rejected and why |

## Location

ADRs MUST live in a `decisions/` directory within the Thing they
govern. A decision about the predicated-knowledge-systems standard goes in
`predicated-knowledge-systems/decisions/`. A decision about the ADR standard
itself goes in `adr/decisions/`.

## Naming

ADR filenames MUST follow: `NNNN-short-title.md` where NNNN is a
zero-padded sequence number within that decisions/ directory.

## Append-only

ADRs MUST NOT be edited after acceptance except to mark them
`status: superseded` and add a `superseded-by` field pointing to the
newer ADR. The body is permanent.
