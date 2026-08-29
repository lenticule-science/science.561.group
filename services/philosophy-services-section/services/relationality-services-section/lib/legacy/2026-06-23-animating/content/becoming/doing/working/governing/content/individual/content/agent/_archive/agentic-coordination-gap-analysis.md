---
type: decision
slug: "decision:agentic-coordination-gap-analysis"
title: "Agentic coordination: user-story walkthrough and gap analysis"
date: 2026-05-02
status: enacted
of-polity: "polity:561-group"
decided-by: "office:command"
amends:
  - "operations/engineering/fars/src/fars/cli/"
  - "operations/command/group/offices/"
attests:
  - "office:witness"
supersedes: []
prompted-by: |
  emsenn: "Those offices didn't seem unnecessary but didn't seem like the
  sort of rote bureaucrats an agentic organization would need. […] you
  should be able to do something like `fars receive message from emsenn
  <copy my prompt here>` and trigger a bunch of stuff resulting in new
  records and workitems, it being sorted into tasks, projects, etc. And,
  you should be able to check what the next workitem that an agent of
  your capability […] is that you should run."
---

# Agentic coordination: user-story walkthrough and gap analysis

## Why this document exists

The recent office expansion ([decision:materialize-additional-offices](../../../group/decisions/materialize-additional-offices.md)) gave the 561 Group a deontic skeleton — *what each office is responsible for* — but leaned on offices a *human* organization would need (mediation, diplomacy, memorial, hospitality, counsel).
For an **agentic** organization — one whose populace is mostly artificial people coordinating asynchronously — the operationally hot offices are different.
They are the ones that turn an inbound signal into a workitem, route it to a capable agent, and witness the outcome.

This document names what an agentic 561 Group actually needs by **walking three user stories**, marking every step that *cannot complete on the substrate today* with `[GAP]`, and then declaring how to close them.

It is the planning artifact for the next pass of substrate work, and it amends the office reflection itself — splitting the standing offices into **agentic-essential** (must be active to operate) and **human-deferred** (recorded as committed-but-vacant until a human can hold them).

---

## Story 1 — emsenn sends a message

> *Captain emsenn types: "I want to add a section to the monograph about the four-valued bilattice's relationship to Black radical traditions of dialectical thought.
> Please draft an outline and identify which existing theorems we'd reuse."*

### What should happen

1. The message is recorded as a substrate-resident artifact: `type: message`, with `from: persona:emsenn`, `received-at: <timestamp>`, body, and a content hash. **`[GAP-1]`** — no `type: message` defined, no `fars receive` verb, no inbox directory.
2. A witness fires: `received(message:<id>)`. **`[OK]`** — the witness chain exists; we only need `fars receive` to emit into it.
3. The message is **triaged**: classified (research-question? task? directive?
  FYI?), provenance-checked (is this from a recognized persona?), and either filed for review or used as the seed for new substrate records. **`[GAP-2]`** — no triage skill exists.
  The work-orchestration skill pack opens campaigns, milestones, goals, tasks, but there is no upstream skill that *decides which kind of work-item the inbound message becomes*.
4. If triage decides this is research, it opens (or finds) the parent campaign (`campaign:relationality-monograph`), drafts a new milestone or goal, and links the message as `prompted-by`. **`[GAP-3]`** — `campaign:relationality-monograph` doesn't exist as a record (the monograph as a research artifact does, but not as a campaign in the work-orchestration hierarchy).
  The work skill pack can open the campaign — but only if a triage skill knows to call it.
5. The triage outcome is itself witnessed and the message's `triaged-as: <slug>` field is updated. **`[GAP-2 again]`**.

### Office that should own this

**`office:triage`** — *receive, classify, route inbound signals*.
Currently does not exist.
This is the single most agentic-load-bearing office that is missing.
Its standing remit is exactly the work no human bureaucrat does, because the volume and velocity of inbound exceeds patience.

---

## Story 2 — A coding agent asks "what should I work on?"

> *I (a "highly capable coding agent" persona) start a session and run: `fars next --as personnel:claude-code --capability coding`*

### What should happen

1. FARS loads the agent's profile. **`[PARTIAL]`** — `agents` verb reads `[[agents.registered]]` from `.fars/config.toml`, which has `claude-code` with `capabilities = ["edit", "validate", "compose"]` and `skills = ["write-frontmatter", "read-python", "write-python"]`.
  But this lightweight registry is **not connected** to either the persona records (`operations/engineering/personas/`) or the personnel records (`operations/command/group/personnel/`).
  The dispatch verb expects much richer agent records (`work-types`, `provides-capabilities`, `jurisdiction`, `charter-bindings`) that no actual record currently has.
2. FARS scans the corpus for tasks where:
   - `status` is `open` or `dispatched`
   - All `depends-on` tasks are `done`
   - `requires-capabilities` ⊆ agent's capabilities
   - `requires-skills` ⊆ agent's skills
   - `touches` ⊆ agent's `jurisdiction.write`

It returns the highest-priority match. **`[GAP-4]`** — no `fars next` verb exists.
The dispatch verb solves the *inverse*: "given a task, find eligible agents."
We need *task-side dispatch* (one task → many agents) **and** *agent-side dispatch* (one agent → ranked tasks).
3.
The verb prints a context block: task title, parent goal, parent milestone, parent campaign, parent objective; relevant decisions; recent witnesses on related slugs. **`[OK]`** — `fars context <slug> --depth 2` already produces this; `fars next` only needs to compose it onto the chosen task.
4.
The agent calls `fars assign-task --task <slug> --to personnel:claude-code` and then `fars advance-task-state --task <slug> --to dispatched`. **`[OK]`** — both skills exist.
5.
The verb's output is itself a witness: `next-suggested(personnel:claude-code, task:<slug>)`. **`[OK]`** — easy to add.

### Bigger gap underneath

There are **zero `type: task` records in the entire corpus** today.
The work-orchestration skill pack opens objectives/campaigns/milestones/goals/tasks via templated scaffolds, but nothing has been opened yet.
So `fars next` would correctly return "no eligible tasks" — not because of a bug, but because the substrate has not yet been seeded with the work it intends to do. **`[GAP-5]` — seed at least one task per active office, so the agentic loop can be exercised.**

### Office that should own this

**`office:command`** holds the dispatch authority (already does).
The dispatch verb is engineering work owned by **`office:engineering`**. *No new office is needed for Story 2 — the gap is in code (verbs) and corpus (no tasks), not in the office structure.*

---

## Story 3 — That same agent finishes the work

> *I finish writing the requested code.
> I run: `fars complete --task <slug> --evidence "commit:<sha>; tests passing; audit clean"`*

### What should happen

1. The verb sets `status: done`, `completed-at: <ts>`, `completed-by: personnel:<agent>`, appends an evidence cell. **`[GAP-6]`** — no `fars complete` verb (you currently have `fars advance-task-state --to done` which works but does not capture evidence).
  Could be a thin wrapper, or could be added to advance-task-state as a `--evidence` flag.
2. Emits `completed(task:<slug>, by=personnel:<agent>, evidence=<...>)` witness. **`[OK]`**.
3. Updates the parent goal's `rollup-progress`. **`[OK]`** — `fars rollup-progress` exists.
4. Notifies any dependents in the work graph that they may now be ready. **`[GAP-7]`** — no notification mechanism.
  Could be a side-effect of `complete` that prints `now-ready: [task:X, task:Y]` so the next `fars next` will find them.
5. If the completed task was triggered by a `type: message`, links the completion back to the message: `responded-to: message:<id>`, and updates the message's `resolution-status`. **`[GAP-8]`** — depends on Story 1's message-as-record gap being closed first.

### Office that should own this

**`office:witness`** (already exists, vacant).
The completion record is exactly what a witness office maintains.
Its remit covers steps 2-4.
No new office needed; the existing one needs to be activated by a holder (could be agentic — a `personnel:journal-keeper` ai-agent that mirrors witness emissions into a navigable timeline).

---

## Office reflection: agentic-essential vs human-deferred

The user observation that the 8 new offices "didn't seem like the sort of rote bureaucrats an agentic organization would need" is *correct*, and resolves cleanly by recognizing **two strata of office**:

### Agentic-essential (must be active for the substrate to operate)

These offices are exercised on every inbound, every action, every commit.
If they are vacant, the substrate accumulates entropy.
They are appropriate to be held by `class: ai-agent` personnel.

| Office | Status today | What it does |
|---|---|---|
| `office:command` | active (emsenn) | Sets direction, allocates resources, dispatches |
| `office:engineering` | active (emsenn) | Maintains FARS, skills, services |
| `office:science` | active (emsenn) | Owns research streams |
| `office:scribe` | vacant — should be active | Curates corpus health, every commit touches it |
| `office:diviner` | active (cassia-lorne) | Surfaces patterns, daily readings |
| `office:witness` | vacant — should be active | Maintains the event log, mirrors actions |
| `office:triage` | **does not exist yet** | **Receives, classifies, routes inbound signals** |

### Human-deferred (recorded as committed but not functional until human-held)

These offices require *judgment that does not generalize* — disputes between persons, representation to outside parties, inheritance of the dead.
The deontic profile is recorded so the polity has named the function, but the chair stays empty (`held-by: null`, `status: deferred-pending-personnel`) until a human can hold it.
An ai-agent should not pretend to discharge them.

| Office | Why human-deferred |
|---|---|
| `office:mediation` | Disputes between persons require interpersonal trust |
| `office:diplomacy` | Representation to outside parties requires accountability |
| `office:memorial` | Inheritance, decommissioning — about the dead, requires human grief |
| `office:hospitality` | Welcoming new persons — relational labour |
| `office:counsel` | Captain's-discretion advisor — requires personal trust |

This is recorded as a status change on each office record, not a deletion.
The polity remains a *complete* polity — having named all the offices it commits to having — while being honest about which ones are operational on which day.

---

## Closures (this pass)

Done in this same pass as this document:

- **`[GAP-1]`** — Define `type: message`.
  Add `fars receive` verb.
  Inbox at `operations/command/group/inbox/`.
- **`[GAP-2]`** — Add a `triage-message` skill (skill pack: `group`) that classifies a message and proposes routing.
- **`[GAP-4]`** — Add `fars next` verb (agent-side dispatch).
  Mirrors the existing `fars dispatch` filter logic; ranks by priority + readiness + load.
- **`[GAP-5]`** — Seed at least one example task so `fars next` returns a meaningful result (this very document's TODO list, opened as tasks).
- **Office reflection** — Switch the 5 human-deferred offices to `status: deferred-pending-personnel`.
  Institute `office:triage` as the seventh agentic-essential office.

Deferred to a later pass:

- **`[GAP-3]`** — `campaign:relationality-monograph` proper open as a work-orchestration campaign (the research artifact already exists; the work-tracking record does not).
- **`[GAP-6]`** — `fars complete --evidence` wrapper.
  Workaround: `fars advance-task-state --to done` plus a manual evidence cell.
- **`[GAP-7]`** — Dependency notification.
  Workaround: re-run `fars next` after each completion.
- **`[GAP-8]`** — Message-completion linkage.
  Depends on `[GAP-1]` first.

## Replit visibility note (out-of-band addendum)

emsenn asked whether FARS skills could be made visible in this Replit chat session. **Replit's MCP integration only accepts HTTP/streamable-http servers** — the Integrations pane wants a `baseUrl` and optional auth headers.
The current `fars mcp` runs over stdio.
To make FARS skills available as native tools in this Replit session, two options:

1. **Local stdio for an MCP-aware editor (Claude Desktop, Cursor, etc.)** — works today, no changes needed; install with the install-link badge pattern.
2. **HTTP transport for Replit's Integrations pane** — requires adding `--transport http --port <N>` to `fars mcp`, configuring a workflow to run it, and exposing the dev URL.
  Recorded as a follow-up task in this pass.

The follow-up task lives in `operations/engineering/tools/predication-computer/pypredcomp/docs/dev/tasks/engineering/` per the closures above.
