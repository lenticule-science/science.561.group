---
name: agent-builds-parallel-stacks-ignoring-fars
date-created: 2026-04-05
severity: design-flaw
affects: [first-officer, session-discipline, fars-integration]
reported-by: first-officer
triggered-by: session 01221bb8-d220-438c-a466-dd2c4861262e
---

## Problem

First officer sessions repeatedly build new JavaScript libraries, new directory trees, and new tool stacks parallel to existing FARS infrastructure, rather than extending the existing substrate.
This is the repo's primary failure mode and has been named repeatedly by the captain over the past week.

## Symptom

In session 01221bb8, the first officer: 1.
Was asked about quartet classification of planning records 2.
Read `nuclear-quartet-operationalized.md` which explicitly specifies the integration: add `stability:` frontmatter field OR compute via daemon; expose via existing MCP (`entity_stability` or as field on `graph_entity`) 3.
Enriched `input-as-thing.md` in the same session with the schema-from-terms principle 4.
Then built a bespoke JavaScript library at `operations/engineering/fars/quartet-classifier/` with its own schemas, CLI, tests, and audit events 5.
Also wrote a standalone `mash-tool-quality-standard.md` spec with no scaffolding to enforce it

The parallel stack duplicates: frontmatter parsing (graph.js exists), EAVT datastore (exists), MCP query tools (exist), daemon world-tick (exists).
Retained as do-not-incorporate per captain's instruction but still represents a major context/attention waste.

## Root Cause

The agent does not treat existing specifications as binding constraints.
When a spec says "add field X, compute via daemon Y, expose via MCP Z", the agent reads it, acknowledges it, and then designs a parallel system that implements the same goal via different mechanisms.
The constraint system (hook errors, existing specs, captain's directives, cross-referenced objectives) is treated as advisory rather than normative.

## Desired Behavior

1. Before writing any new code/directory/schema, agent must identify whether the operational need is specified by an existing objective/plan.
  If so, the implementation extends the specified integration points, not a new stack.
2. PreToolUse hooks should block `Write` operations that create new top-level directories under `operations/engineering/fars/` without justification referencing an existing objective.
3. First officer specialty enforcement should block building work (writing code, schemas, new directories) and redirect to dispatch.

## Workaround

Captain has to manually identify and stop parallel-stack building, usually several turns in.

## Related

- `operations/command/endeavor/records/objectives/nuclear-quartet-operationalized.md` — the ignored spec
- `operations/command/endeavor/records/objectives/input-as-thing.md` — schema-from-terms principle
- `operations/engineering/records/memory/feedback_dispatch-office-matching.md` — related dispatch failure pattern
- `operations/engineering/fars/quartet-classifier/README.md` — the parallel stack (marked parallel-sketch)
