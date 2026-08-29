---
title: "Standards deviation measurement"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
type: plan
status: active
priority: medium
supersedes: "0058"
keywords:
  - Standards
  - Validation
  - Repository
goal: "003"
depends-on: []
---

## Goal

Build a general capability: given any standard that has a
`practices/specification.md` and optionally a `shapes.ttl`, measure
how much the repository deviates from it and rank files by deviation
severity.

This is infrastructure for all standards, not a one-off tool for one
standard. The knowing-semioverse standard is the first use case but
not the only one.

## Phases

### Phase 1 — Skill: measure-deviation-from-standard

A skill that takes a standard as input and produces a ranked deviation
report. Initially inference-based (an agent reads the standard's
specification and evaluates files); progressively automated toward
script and MCP runtime as the pattern becomes deterministic.

Lives at: `information/disciplines/knowledge-systems/standards/
knowing-semioverse/skills/measure-deviation/`

### Phase 2 — Script: serialize and validate mechanically

For standards that express their rules as SHACL shapes:
1. Walk content/, serialize frontmatter as Turtle
2. Run pyshacl against the standard's shapes.ttl
3. Score violations, output ranked report

The knowing-semioverse standard should have shapes.ttl written as
part of this phase.

### Phase 3 — Make standards self-describing for deviation

Each standard's `practices/specification.md` should declare what
kinds of deviation it can detect, so the measurement skill knows
what to look for without reading the whole spec.

## Log

2026-03-09 — Plan created. Supersedes 0058 which was too specific
to one standard and one implementation approach.
