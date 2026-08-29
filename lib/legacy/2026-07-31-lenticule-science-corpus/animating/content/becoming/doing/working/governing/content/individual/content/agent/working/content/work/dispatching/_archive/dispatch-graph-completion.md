---
name: dispatch-graph-completion
specialization: plan
date-created: 2026-04-30
horizon: week
work-type: procedure
serves: [operations-loop, dispatch]
depends-on: [operational-records-as-dag]
contributes-to: [agentic-orchestration]
produces: queryable-dispatch-with-capability-matching
status: draft
---

The first-pass dispatch script (`engineering/services/dispatch/triage/dispatch.py`) matches tasks to agents by `work-type` only, with a fuzzy text-match fallback against `requires:`.
This produced the data issue surfaced when querying `achievement-system`: 13 procedure-handling agents matched the work-type, but none provided "writing" or "review" capabilities — and the strict capability filter then dropped all of them.

Capabilities are categorically different from work-types:

- **work-type** (process / procedure / derivation / inquiry) — the *settlement state* of the work; what kind of computation it is.
- **capability** (writing, review, code-review, security-audit, accounting, build-fix, ...) — *what the work touches*; a domain-of-action signature independent of settlement.

A task can be `work-type: procedure` AND `requires-capabilities: [writing, review]` — meaning the procedure decomposes into writing subtasks (procedure-type, performed by a writing-capable agent) and review subtasks (derivation-type, performed by a review-capable agent).

The current `requires: [...]
` field on tasks is a fuzzy capability list.
The schema cleanup separates this into `requires-capabilities:` (the categorical signature) and `requires-skills:` (specific named skills from the skill catalog).

## Tasks

- `dispatch-add-capabilities-to-agents` — add `provides-capabilities:` to every agent
- `dispatch-replace-requires-with-capabilities` — convert task `requires:` → `requires-capabilities:`
- `dispatch-add-requires-skills-to-tasks` — for tasks where a specific skill is required (not just a capability), add `requires-skills:`
- `dispatch-update-script-capability-match` — extend `dispatch.py` to filter by `requires-capabilities ⊆ provides-capabilities`

## Acceptance

- `dispatch.py achievement-system` returns at least one eligible agent (or surfaces a real decomposition need — see `workflow-task-decomposition` plan)
- The 49 catalog skills cluster into ~10 capabilities (writing, review, code-review, search, render, dispatch, build-fix, audit, etc.) and every agent's `provides-capabilities` list is non-trivial
