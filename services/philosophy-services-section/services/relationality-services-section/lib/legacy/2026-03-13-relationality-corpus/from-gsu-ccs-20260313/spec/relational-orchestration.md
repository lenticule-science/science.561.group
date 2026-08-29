---
name: relational-orchestration

description: "Specification for the repository orchestration system: how work enters, gets stored, gets executed, and gets verified done."
defines: RelationalOrchestration
---

The orchestration system moves work from input to verified completion. It has four
concerns: intake, storage, execution, and loop closure.

---

## Work storage

Work lives in the cold store as markdown. Two kinds of work files exist in every department:

- **INBOX.md** — incoming messages not yet acted on. Each entry is a [Message](unit.md).
- **PLANS.md** — work items with explicit done conditions. Each entry is a [WorkItem](work-item.md).

These files are the system's state. There is no separate state store for the orchestration
system — reading INBOX and PLANS gives the full picture of what is pending, in-progress,
blocked, and done.

---

## Intake

Work enters the system through the Frontier (MCP server). The entry point for operator
input is the `UserPromptSubmit` hook, which wraps every message with:

- a prescript orienting Claude as the system's natural language interface
- a postscript with the `skills/interpret-prompt.md` skill

Claude receives the wrapped message, classifies it into typed PromptUnits, and calls
`run_runbook('route-units', {units: [...]})` to write them to the appropriate INBOXes.
`route-units` is a process-type runbook — deterministic, no LLM.

---

## Execution

Work is executed by LangGraph graphs. A graph is a state machine over Units:

- it reads current Unit state from the cold store (via the hot store)
- it does work — calling runbooks, scripts, or Claude at decision points
- it writes Units back to cold store
- it checks a done condition before terminating

**A graph that exits without verifying its done condition is a bug.**

Graphs hand off to each other by writing Units. A graph that cannot finish writes a
WorkItem with `status: blocked` and exits. The next invocation resumes by reading
that WorkItem. The cold store is the handoff mechanism — no internal graph state
is preserved between runs.

### Runbooks

Linear workflows that do not require a loop or done-condition check are expressed
as runbooks (YAML, cold-stored in `runbooks/`). The runbook executor dispatches
steps mechanically. Step types: `llm-call`, `write`, `for-each`, `call`, `script`,
`collect`. Runbooks with no `llm-call` steps are process-type — fully deterministic.

### LLM calls

An LLM call is appropriate when a step requires judgment that cannot be determined
from the Unit's existing fields. Typed output is validated by PydanticAI before
it re-enters the graph.

---

## Loop closure

Every department has two loops that must stay closed:

**Triage loop** — INBOX messages → WorkItems in PLANS. Done when INBOX is empty
or every message has a corresponding WorkItem. Triggered whenever a message is
written to an INBOX.

**Improvement loop** — open WorkItems → completed WorkItems. Done when no open
non-blocked WorkItems remain. Triggered on demand (operator `/skill` invocation
or scheduled).

A loop is closed when its done condition holds. Stale WorkItems and unread INBOX
messages are worse than ignorance — they actively misdirect. The orchestration
system is responsible for ensuring loops close, not just for starting them.

---

## Component map

| Component | What it is | Where it lives |
|---|---|---|
| Frontier | MCP server entry point | `src/engine/mcp_server.py` |
| Runbook executor | YAML step dispatcher | `src/engine/runbook_executor.py` |
| Triage loop | LangGraph graph: INBOX → PLANS | `src/engine/graphs/triage.py` |
| Improvement loop | LangGraph graph: PLANS → done | `src/engine/graphs/improve.py` |
| Cold store | Markdown files | `*/INBOX.md`, `*/PLANS.md`, etc. |
| Hot store | SQLite Unit table | `src/engine/db.py` |
| Loader | Cold → hot | `src/engine/loader.py` |
| Serializer | Hot → cold | `src/engine/serializer.py` |

---

## What does not belong here

The mathematical structure of the repository (history monoid, fiber algebras, nuclei)
is specified in [relational-machine](relational-machine.md). That spec governs the
*semantics* of what the system computes. This spec governs *how the plumbing works*.
Do not conflate them.
