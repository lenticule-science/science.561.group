---
id: flatfile-agential-resource-system-wind-down-workflow
description: "Specification for the wind-down workflow: closing a work session by triaging INBOXes, deleting completed work, writing behavioral MemoryEntries, and committing. Includes implementation notes for the Claude agent executor."
extends: Workflow
component-of: FlatfileAgentialResourceSystemLocale
date-modified: 2026-03-19
params:
  repository-state: relational-universe
output: relational-universe
ast:
  session-closure-endomorphism:
    - repository-state:
        - triage-phase
        - debt-review-phase
        - memory-phase
        - cleanup-phase
        - commit-phase
        - report-phase
title: Flatfile Agential Resource System Wind-Down Workflow
---

# Flatfile Agential Resource System Wind-Down Workflow

The FlatfileAgentialResourceSystemWindDownWorkflow closes a work session cleanly.
It is a [Workflow](workflow.md) whose domain and codomain are both "repository state" — the session starts with accumulated work and ends with that work integrated, triaged, or explicitly deferred.

The skill implementation is [skills/wind-down.md](../../../../../../../library/relational-hyperverse-repository/skills/wind-down.md).

## Phases

1. **Triage** — every locale INBOX is cleared; all messages get a status
2. **Debt review** — recent changes are scanned for induced gaps; findings go to INBOXes
3. **Memory** — behavioral MemoryEntries written (not session summaries)
4. **Cleanup** — completed OperationItems deleted from all PLANS.md files
5. **Commit** — dirty working tree committed if present
6. **Report** — open items, blockers, and top priorities for next session stated

## Trigger

Invoked by the operator (`/wind-down`) or automatically by the context monitor hook when context usage reaches ~90%.

## Open questions
