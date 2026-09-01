---
title: "Progressive Automation: Agent Demotion Strategy"
description: Plan to migrate agents down the formality stack by demoting fuzzy tasks to deterministic tools, skills, and hooks to reduce token costs.
date-created: 2026-04-04
type: note
name: progressive-automation-plan-context
keywords:
  - progressive-automation
  - agent-demotion
  - formality-hierarchy
  - deterministic-tools
  - token-optimization
specialization: analysis
serves: progressive-automation-plan
---

Policy 001: every task completion should encode itself so a less capable agent can do it next time. The offices-as-fuzzy-cells analysis identified 7 offices at near-F3 formality whose work is deterministic given inputs. We are wrapping parameterized commands in inference agents. A first-officer `harness-cleaner` dispatch spawns a sonnet subagent (~4K system prompt), which runs the same grep/glob/read pipeline every time, formats markdown, returns. ~10K tokens for work a 50-line script could do.

## The settlement path: agent → skill → tool → hook

| Level | When | Permission | Cost |
|---|---|---|---|
| Agent | irreducibly fuzzy, needs judgment/synthesis/multi-step reasoning | subagent spawn, user approval per tool | high (~10K+ tokens) |
| Skill | structured procedure, fixed steps needing inference to parameterize | loaded into calling agent's context | medium (~2K tokens) |
| Tool | deterministic given parameters, node script | runs as calling process, no approval | low (~100 tokens per call) |
| Hook | triggered by events, no dispatch needed | async or blocking on event | zero dispatch cost |

## Wave 1 — read-only reporters (lowest risk, highest savings)

**1. harness-cleaner → harness-audit.js** — sonnet agent runs fixed grep/count pipeline classifying UNUSED/STALE/DUPLICATE. Node script takes `--scope agents|skills|hooks|commands|all`. Agent prompt IS the spec.

**2. graph-analyst → query-library-graph.js `report` subcommand** — already exists as a tool; the agent just picks which query. Add `report` for common queries (coverage, gaps, orphans, stats). Cartographer subsumes graph-analyst for anything needing judgment.

**3. docs-lookup → library-search.js** — agent runs three-step fallback (graph query → filename glob → content grep). Node script implements the same pipeline. Researcher subsumes for interpretation.

## Wave 2 — deterministic producers (write files)

**4. doc-updater → update-indexes.js + hook** — regenerate indexes from filesystem reality; could become PostToolUse hook on Write/Edit. Writes are a pure function of filesystem.

**5. quartermaster → resource-report.js** — composes existing tools (graph stats, events, session metrics); threshold-based flagging is already formal. Low risk (read-only despite Bash access).

**6. bookkeeper → ledger.js (extend finance-report.js)** — records transactions, runs trial balances. Double-entry invariant (debits=credits) is algebraically checkable. Moderate risk — writes to ledger but with strict rules.

## Wave 3 — pattern detection (needs care)

**7. observer → pattern-detector.js + hook integration** — sequence analysis on observation JSONL with configurable thresholds (3+ → instinct). Confidence scoring is already a formal function. Moderate risk — current system works; implementation needs care against false positives.

## What stays as agents (irreducibly fuzzy)

| Office | Why stays | Formality ceiling |
|---|---|---|
| architect | system design needs contextual judgment | F1 site, F1 production |
| researcher | reading comprehension + synthesis across sources | F1/F1 |
| triage-processor | unstructured → structured needs editorial judgment | F0 recognition |
| writer | prose quality not formalizable | F1 production |
| planner | decomposition of novel requests | F1 recognition |
| chief-of-staff | cross-domain synthesis | F1 production |
| operations-officer | work management prioritization | F2 judgment-heavy |
| helmsman | dispatch routing matching | F2 context-dependent |

## How dispatch changes

**Current:** user → first officer infers WHAT+WHO → spawns agent → agent infers HOW → executes.
**Target:** user → first officer infers WHAT → calls tool directly (F3 offices) OR spawns agent (F1 offices).

Key insight: the first officer already infers which office to dispatch. For F3, that's ALL the inference needed — execution is deterministic. Spawning an agent just to run a deterministic pipeline is double-inferring.

**Permission model fix:** agents spawn as subprocesses with per-tool approval (20 greps = 20 approvals). Tools run as calling process — `node harness-audit.js` is one Bash invocation, one approval for the whole pipeline.

## Task list

- `pa-demote-harness-cleaner` — write harness-audit.js, verify matches agent output, remove agent
- `pa-demote-graph-analyst` — add `report` subcommand to query-library-graph.js, verify, remove agent
- `pa-demote-docs-lookup` — write library-search.js, verify fallback pipeline, remove agent
- `pa-demote-doc-updater` — write update-indexes.js, verify, remove agent, consider PostToolUse hook
- `pa-demote-quartermaster` — write resource-report.js composing existing tools, verify, remove agent
- `pa-demote-bookkeeper` — extend finance-report.js for transaction recording, verify, remove agent
- `pa-demote-observer` — write pattern-detector.js, verify against current instinct creation, remove agent
- `pa-update-dispatch-layer` — update dispatch-work.js + duty-dispatch skill to call tools directly for demoted offices

## Success criteria

- each demoted agent's output reproduced by its tool replacement (test: diff)
- token cost per invocation drops >80% for demoted functions
- no new user approval prompts for previously-autonomous operations
- irreducibly fuzzy agents NOT touched
