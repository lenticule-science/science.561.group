---
title: Agent Dispatch Operations Plan
description: Specification for agent work dispatch, covering capability matching, authority delegation, handoff protocols, and a three-phase implementation roadmap.
date-created: 2026-04-03
type: note
name: ops-dispatch-stage-context
keywords:
  - agent-dispatch
  - capability-matching
  - authority-delegation
  - handoff-protocol
  - event-sourcing
  - work-agent-matching
specialization: analysis
serves: ops-dispatch-stage
---

## Scope

The dispatch stage owns:
- Agent capability discovery and classification
- Work-to-agent matching (can this agent do this work?)
- Authority delegation (is this agent authorized for this scope?)
- Capacity checking (does this agent have bandwidth?)
- Push vs. pull mechanisms (how does work reach agents?)
- Assignment creation and tracking
- Handoff protocol definition
- Audit trail of all assignments

## Current Infrastructure

### Built (2026-04-03)

- **dispatch-work.js** — queries datastore for ready tasks, matches to agents by capability score, checks WIP limits, creates assignment events. Implements Gerkey-Matarić capability matching, Goldratt capacity constraints, Anderson pull-based ordering.
- **record-event.js** — creates timestamped JSONL event records for all 6 stages. Events are append-only ground truth (Young 2010 event sourcing). Validates action types.
- **query-events.js** — reads event log, computes flow metrics (cycle time, lead time, throughput, WIP), filters by subject/action/actor/date.

### Agent capability model

Agent capabilities are extracted from their description frontmatter via keyword matching. The `extractCapabilities()` function maps description text to domain capabilities (planning, review, execution, documentation, security, research, infrastructure, operations, coordination, learning) and work type capabilities (derivation, inquiry, procedure, process).

### Dispatch flow

1. Query datastore for open tasks with met dependencies
2. Match each task to agents by capability score (domain + work type + keyword proximity)
3. Check WIP limits (default 5, configurable)
4. Output dispatch table or create assignment events (--assign flag)

## Task Breakdown

### Phase 1: Foundation — Explicit capabilities (no dependencies)

**agent-capability-frontmatter** — Replace keyword extraction with declared capabilities. Each agent definition gets a `capabilities:` block with `domains:` and `work-types:` lists. dispatch-work.js reads these instead of guessing from description text. This is procedure work — the pattern is clear, we just need to do it for all 11 agents.

**handoff-protocol-enforcement** — Define a handoff schema and validate it in `/orchestrate`. Currently the orchestrate command specifies a format but doesn't enforce it. Grounded in Honda/Yoshida/Carbone multiparty session types (POPL 2008). Parallel with capability work — no dependency between them.

### Phase 2: Enrichment — Authority and mechanism (depends on Phase 1)

**authority-scope-checking** — Enforce delegation boundaries on dispatch. Agents can only be assigned work within their authorized scope. Requires capability frontmatter to be in place first. This is derivation work — we need to design the scope model (path patterns? departments? domains?) before implementing.

**push-pull-dispatch-selection** — Work reaches agents through the mechanism appropriate to its work type. Push for settled execution (procedure, process), pull for unsettled (derivation, inquiry). Requires capability frontmatter. Also derivation — the design question (how to signal readiness in stateless sessions) needs answering.

### Phase 3: Resilience — Failure handling (depends on Phases 1 and 2)

**failure-reassignment-saga** — When an agent fails, record failure and reassign with context. Requires both capability frontmatter (to find alternative agents) and handoff protocol (to include failure context in reassignment). Derivation — saga pattern needs adaptation to our stateless agent model.

## Theoretical Grounding

| Task | Library concept | Key insight |
|------|----------------|-------------|
| agent-capability-frontmatter | role — capability signature | Agent capabilities ARE the capability signature κ_R |
| authority-scope-checking | delegation — boundedness invariant | Grants must be strictly specified |
| handoff-protocol-enforcement | multi-agent orchestration — session types | Handoffs are lightweight session types |
| push-pull-dispatch-selection | dispatch and delegation survey — kanban pull | Pull when execution is unsettled |
| failure-reassignment-saga | delegation — revocability invariant | Principal may revoke and re-delegate |

## Cross-Plan Dependencies

- **From agent-governance-enrichment plan:** The `research-agent-governance-bridge` task there will inform design decisions here (especially authority-scope-checking and push-pull-dispatch-selection).
- **From agentic-orchestration plan:** Phase 7 (computational bridge) envisions predicate-derived capabilities replacing keyword extraction. agent-capability-frontmatter is the intermediate step.
- **From ops-tracking-stage plan:** Dispatch events feed tracking.
- **From ops-execution-stage plan:** failure-reassignment-saga touches both: failure is detected during execution but handled by re-dispatch.

## Mutation Log

### 2026-04-04 — Coherence audit: overlap with office-vocabulary-overhaul

The plan coherence audit identified that `agent-capability-frontmatter` overlaps significantly with office-vocabulary-overhaul (ovo) Step 1, which adds `department:`, `serves:`, `action-domain:`, `duties:`, `autonomous:`, `escalates:` to agent definitions. ovo is the more comprehensive plan and subsumes the capability frontmatter work. This plan retains its unique tasks (`handoff-protocol-enforcement`, `push-pull-dispatch-selection`, `failure-reassignment-saga`) and defers to ovo for the agent definition enrichment work.

## Success Criteria

- Dispatch decisions are deterministic given the same inputs (no keyword ambiguity)
- Every dispatched task has an event trail (assigned → started → completed/failed)
- Failed dispatches trigger reassignment with failure context
- Authority violations are caught at dispatch time, not at execution time
- The dispatch flow handles all four work types appropriately
