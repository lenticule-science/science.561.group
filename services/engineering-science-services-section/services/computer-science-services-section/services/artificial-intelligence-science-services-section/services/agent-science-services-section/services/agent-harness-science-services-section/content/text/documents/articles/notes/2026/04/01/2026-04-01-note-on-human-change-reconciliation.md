---
title: Human Change Reconciliation
description: Describes a session-start reconciliation process for detecting unstructured human changes, triaging them, and ensuring knowledge graph freshness before agents proceed.
date-created: 2026-04-01
type: note
name: human-change-reconciliation
keywords:
  - session-start
  - change-reconciliation
  - triage
  - work-records
  - knowledge-graph
specialization: plan
serves-system: foah
project: generative-harness
---

## User prompt (2026-04-01)

> Right now our repo is set up basically that if stuff goes through agentic orchestration, it's fine enough. But if a human or someone were to do a bunch of work in the repo, it'd just... never get handled.
>
> And so I'm wondering how to plan out whatever hooks and such that human users can do whatever they want, and the first time an agentic operation tries to get done, it ends up triggering a "oh go deal with the human's mess" assignment to the appropriate planning agents and such.

## The problem

Agents create typed records (tasks, plans, objectives) with proper frontmatter. Humans don't — they edit files, add new ones, delete things, move stuff around. None of that gets recorded as work. When the next agent session starts, it has no idea what happened. The knowledge graph is stale, cross-references may be broken, new files lack frontmatter, moved files have dead links.

Currently the SessionStart hook loads previous session state and memory. It does NOT:
- Diff the repo against the last known state
- Detect new/modified/deleted files since last session
- Check if the knowledge graph is stale
- Triage unstructured changes into work records
- Flag broken cross-references from moves/renames

## What this plan needs to produce

1. **A session-start reconciliation step** — before the agent does anything, it diffs the repo against the last known commit (stored in session-state/latest.json). If there are changes the agent didn't make, it flags them.

2. **A triage dispatcher** — when unstructured changes are detected, route them to the appropriate handler: new .md files without frontmatter → check-frontmatter warnings. Moved files → broken link scan. Deleted files → orphan reference check. Modified files → knowledge graph regeneration.

3. **Work record creation** — the reconciliation itself becomes a logged task: "Reconciled N human changes from commits X..Y" with what was found and what was done about it.

4. **The graph staleness check** — compare knowledge-graph.json's generation timestamp against the most recent commit touching library/ or operations/. If stale, regenerate before proceeding.

## What this does NOT mean

- Humans don't need to follow any process. They do whatever they want. The harness adapts.
- No blocking — reconciliation is informational and creates triage items, not errors.
- No second-guessing human intent — if a human deleted a file, it's deleted. The reconciliation notes the deletion and checks for orphan references, it doesn't undo anything.

## Related

- The input-processing-pipeline task is the general case (raw input → typed records)
- The work-hierarchy-enforcement task provides the validation that reconciliation checks against
- The knowledge graph (Datascript) is what needs to stay current
