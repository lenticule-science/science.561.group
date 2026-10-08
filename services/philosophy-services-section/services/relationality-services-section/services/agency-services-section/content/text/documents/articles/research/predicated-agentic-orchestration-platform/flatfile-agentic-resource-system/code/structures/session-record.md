---
name: session-record
description: Session record
type: definition
class: record
instantiates: [session, session-record]
depends-on: [session-as-entity, agent-record, office-record, three-tier-memory, witness]
see-also: [observation-record, instinct-record, open-session, close-session, resume-session]
title: session-record
---

# Session record

The substrate-record holding one session: the substrate-resident entity carrying the session's identity, its inhabiting agent, its installed office, its scope, its lifecycle state, its working memory, and its event chain.
A `SessionRecord` is FARS's realization of AgOP's [session-record](../../../objects/session-record.md) at the bilattice value-domain.

Per [session-as-entity](../../entity/session-as-entity/session-as-entity.md), the session IS the record.
Operations on the session are operations on substrate predications: opening a session is creating the record; pausing the session is editing its lifecycle predicate; closing the session is finalizing its closing-predicate cells; resuming a session is reading the record and rebinding the realization's compute resources to it.

## Required fields

Every conforming realization SHALL hold, for each `SessionRecord`:

### Identity

- **`name`** — canonical session identifier within the substrate.
  Often a content-derived hash plus a human-readable suffix (e.g., `2026-05-01T14:32-bilattice-research`).
- **`opened-at`** — ISO-8601 timestamp of the session's `open-session` event.
- **`closed-at`** — ISO-8601 timestamp of the session's `close-session` event, or null if the session is still in `open` / `active` / `paused` state.

### Investiture

- **`agent`** — reference to the [`AgentRecord`](agent-record.md) inhabiting the session.
- **`office`** — reference to the [`OfficeRecord`](office-record.md) installed for this session.
  The office's constructors and authority are what the agent operates under.
- **`scope`** — the substrate region the session operates within.
  Inherited from the office's scope unless narrowed at session-open.
- **`investiture-event`** — reference to the substrate event that recorded the agent's investiture into the office for this session.
  Per [`open-session`](../morphisms/open-session.md).

### Lifecycle

- **`state`** — one of `open`, `active`, `paused`, `closing`, `closed`.
  The session's current lifecycle phase.
- **`state-history`** — chronological list of state-transition events.
  Used by anomaly-detection rules to flag unhealthy transitions (e.g., a session that bounces between `paused` and `active` repeatedly).
- **`closure-rule-system`** — reference to the [`ClosureRuleSystem`](closure-rule-system.md) version active for this session.
  Pinned at open-session for replay determinism; subsequent rule-system edits do not retroactively change the session's behavior.

### Working memory

- **`always-loaded`** — the office fiber composed at session-open per [three-tier-memory](../../architecture/three-tier-memory/three-tier-memory.md).
  Re-rendered if the office's fiber is edited mid-session, with the change recorded as a substrate event.
- **`working-state`** — the session's accumulated working state — predications produced during the session that don't (yet) belong to a more durable record.
  Includes runbook-execution intermediate state, multi-step query progress, draft entities not yet committed.
- **`observation-cursor`** — high-watermark in the substrate's event log up to which the session's observation rules have processed.
  Used by consolidation to know which observations are session-bounded.

### Output

- **`emitted-events`** — list of references (by hash) to events emitted on this session's behalf.
  Each event cites the session in its `actor` or `origin` field.
- **`witness-chain`** — composed witness chaining the session's per-action witnesses.
  Used for end-to-end audit of the session's substrate effects.

### Description

- **`description`** — human-readable note declaring the session's purpose.
  Provenance only.
- **`tags`** — optional classification labels (`research`, `operations`, `triage`, `experiment`).
  Used for filtering across sessions.

## Invariants

- **Substrate entity.** A `SessionRecord` SHALL be a substrate entity, addressable like any other.
  Lifecycle transitions are substrate edits per [`apply-edit`](../transformers/apply-edit.md).
- **Lifecycle-phased.** Every state transition (`open` → `active` → … → `closed`) SHALL produce a substrate event.
  A realization that transitions states without emission has lost the audit chain.
- **Investiture-witnessed.** The session's investiture event SHALL be in the substrate.
  A session cannot exist without a recorded investiture.
- **Rule-system-pinned.** The cited `closure-rule-system` version SHALL be in the substrate's rule-system registry at session-open and SHALL remain reachable for the session's lifetime (events from the session cite this version; replay needs it).
- **Event-cited.** Every event emitted by the session SHALL cite the session's name in the `actor` or `origin` field.
  Events cannot be silently attributed to "the agent" without the session linkage.
- **Closure-stable.** A session in `closed` state SHALL NOT be mutated.
  Edits to a closed session are non-conformance; corrections are emitted as retraction events per [event-sourcing](teaching/explanations/event-sourcing.md).

## What a `SessionRecord` is not

- **Not a chat history.** A chat history is a sequence of human-AI message exchanges; a session may include those but is not constrained to them.
  A session may consist entirely of substrate edits, batch operations, or tool invocations.
- **Not a process.** Two processes serving the same session record act as one session for substrate purposes.
  The realization's process management is separate from the substrate's session record.
- **Not a transaction.** Closed sessions are not rolled back.
  Per [event-sourcing](teaching/explanations/event-sourcing.md), corrections produce retraction events; the original session events remain.
- **Not the agent.** Agents persist across sessions; sessions are bounded engagements between an agent and an office at a scope.
  An agent has many session records over its lifetime.

## Position

`SessionRecord` is the substrate-level statement of "this session exists, with this agent in this office at this scope, in this lifecycle phase, with this working memory, having emitted these events."
It is what makes [`open-session`](../morphisms/open-session.md), [`close-session`](../morphisms/close-session.md), [`resume-session`](../morphisms/resume-session.md), and [`consolidate`](../transformers/consolidate.md) coherent: those morphisms read and write `SessionRecord` entities through the substrate's standard operators.

The record composes with [`AgentRecord`](agent-record.md) (the inhabitant), [`OfficeRecord`](office-record.md) (the installed office), [`ClosureRuleSystem`](closure-rule-system.md) (the rules in force), and [`Observation`](observation-record.md) (the session's accumulated observations).
