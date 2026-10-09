---
type: concept
class: agent-discipline
depends-on: [agent, work-item, agent-self-queued-work, predication-fiber-algebra, four-bilattice, signature, self-representation]
see-also: [agent-self-queueing-bounded-by-modal-restriction, opportunistic-scheduling-loop, dispatch]
title: Goal
description: The substrate's agent-admitted predication declaring a desired outcome — distinct from a work-item (which declares "do this work") and from a user-decision (which records a gesture).
---

# Goal

The substrate's *agent-admitted predication declaring a desired outcome* — distinct from a [work-item](../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md) (which declares "do this work") and from a [user-decision](../user-decision/user-decision.md) (which records a gesture).
A goal says *what* the agent wants achieved; closure rules translate goals into work-items that pursue them.

In the substrate's hyperdoctrine setting, a goal is *a substrate cell in the agent's intentional fiber* — admitted by the agent, signed by its session, with closure rules defining how the goal decomposes into pursuable work.
Per [agent-self-queueing-bounded-by-modal-restriction](../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), the work-items derived from a goal are bounded by the agent's modal-restricted capability — the agent cannot pursue goals requiring authority beyond its grant.

## Why this concept exists

The math agent's "I want arxiv papers on $K$" appears throughout the orchestration discipline as something the agent admits, but it isn't named.
We've been writing "the agent admits a goal cell" without a concept defining what a goal cell *is*.
A goal is structurally distinct from:

- A [work-item](../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md) — which is "do this specific work to advance some end."
  A goal might generate multiple work-items, possibly over time, possibly contingent on intermediate results.
- A [user-decision](../user-decision/user-decision.md) — which is a UI-gesture-as-substrate-admission, typically about a specific entity ("accept this request").
  A goal is intentional rather than reactive.
- A [dispatch](dispatch.md) — which is the active assignment of a work-item to an executing agent.

A goal sits at the *highest abstraction level* of the orchestration chain: goal → closure-rule-derived work-items → opportunistic-scheduling-picks → dispatches → executions → outputs → next-iteration goals.

## Goal structure

A goal is a substrate cell with the following predications:

```json
{
  "kind": "goal",
  "goal-id": "<canonical hash>",
  "goal-kind": "<kind-hash, e.g., 'find-literature-on', 'verify-theorem', 'plan-meeting'>",
  "subject": "<entity-hash the goal is about>",
  "parameters": {
    "<goal-kind-specific parameters>"
  },
  "owner": {
    "session-hash": "<the session that admitted the goal>",
    "agent-hash": "<the goal-owning agent>"
  },
  "queued-at-ordinal": <substrate ordinal>,
  "priority": "<low | medium | high | urgent>",
  "value-estimate": <number in [0, 1]>,
  "expiry-ordinal": <substrate ordinal | null>,
  "completion-criterion": {
    "kind": "<predicate-criterion | external-witness | manual-attest>",
    "<criterion-specific fields>"
  },
  "state": "<pending | active | satisfied | abandoned | expired>",
  "signature": {
    "scheme": "Ed25519",
    "signing-key-hash": "<owner's session signing key>",
    "value": "<base64>"
  }
}
```

Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), the goal-id is the canonical-form hash.
Per [signature-binds-witness-to-identity](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/signature-binds-witness-to-identity.md), the signature binds the goal to its owner.

## Goal kinds

Common goal kinds, each with declared closure rules for translation:

- **`find-literature-on`** — the math agent's example.
  Parameters: `keyword`, `recency-window`, `desired-paper-count`.
  Closure rule: emit a `fetch-arxiv-papers` work-item.
  Completion: enough relevant papers are admitted to substrate content.
- **`verify-theorem`** — the math agent's higher-level goal.
  Parameters: `theorem-hash`, `proof-search-strategy`.
  Closure rule: emit `proof-search` work-items, possibly `find-literature-on` sub-goals.
  Completion: a verified-proof witness is admitted.
- **`plan-meeting`** — a user-facing goal.
  Parameters: `participants`, `duration`, `time-window`.
  Closure rule: emit `query-availability` work-items (one per participant), then a `propose-meeting-time` work-item.
  Completion: meeting-scheduled witness.
- **`monitor-metric`** — a long-running goal.
  Parameters: `metric`, `threshold`, `alert-recipients`.
  Closure rule: continuously emit `check-metric` work-items at declared intervals.
  Completion: explicit goal-abandonment (the goal runs indefinitely otherwise).
- **`process-message-batch`** — a queue-handling goal.
  Parameters: `inbox-hash`, `batch-policy`.
  Closure rule: emit per-message `handle-message` work-items.
  Completion: inbox-empty-or-batch-complete witness.

## Goals decompose into work-items via closure rules

Per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the goal-to-work-item decomposition is itself substrate content — closure rules per [closure-rule-wire-format](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/closure-rule-wire-format.md).
Each goal-kind has one or more closure rules:

```
goal G of kind 'find-literature-on' with parameters P
∧ G.state = pending
→
admit work-item {
  work-kind: 'fetch-arxiv-papers',
  required-capability: [arxiv-search, http-fetch, pdf-parse, storage-write],
  cost-estimate: <derived from P>,
  ...
  parent-goal: G.goal-id
}
∧ G.state := active
```

The work-item links back to the goal via `parent-goal`; per [work-graph](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/work-graph.md), the goal-and-its-derived-work-items form a tree.

Per [agent-self-queueing-bounded-by-modal-restriction](../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), the derived work-items inherit the goal's owner, so the bounded-autonomy check applies to each: the agent admits a goal, the goal generates work-items, each work-item is checked against the agent's modal-restricted capability.

## Goal completion criteria

Goals end via four mechanisms:

- **Predicate criterion**: a closure rule fires when a substrate predication matches, marking the goal `satisfied`.
  E.g., for `find-literature-on`, "10 relevant papers are admitted."
- **External witness**: a witness from a designated external agent or user marks the goal `satisfied`.
  E.g., a user explicitly says "I'm done with this."
- **Manual attest**: the goal owner explicitly admits a `goal-satisfied:{goal-id}` cell.
- **Expiry**: the goal's `expiry-ordinal` passes without satisfaction; state transitions to `expired`.
  Per [retraction](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md), pending derived work-items are retracted.

The completion criterion is part of the goal cell, so closure rules can read it directly.

## Goal abandonment

A goal can be abandoned before completion (the agent decides the goal is no longer worth pursuing, the user cancels it, governance retires it).
Per [retraction](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md), abandonment is a substrate operation:

```
admit goal-abandoned:{goal-id} cell
→
G.state := abandoned
∧ retract pending work-items derived from G
∧ leave completed work-items in the audit chain
```

Per [witness](../../teaching/explanations/witness.md), abandonment is auditable; per [scope-cover-via-grothendieck-site](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/scope-cover-via-grothendieck-site.md), the goal's history is preserved as a sub-cover even after abandonment.

## Goals can have sub-goals

A goal may itself generate sub-goals (not just work-items).
The math agent's `verify-theorem` might generate `find-literature-on` as a sub-goal, which itself generates work-items.
Per [event-causality-via-lorentzian-settling](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/event-causality-via-lorentzian-settling.md), the goal hierarchy is a partial order; per [work-graph](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/work-graph.md), sub-goals form trees within the substrate's work-graph.

Sub-goals are bounded by the parent goal's authority — per [agent-self-queueing-bounded-by-modal-restriction](../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), the agent cannot create sub-goals requiring more authority than the parent goal already used.

## What the discipline rules out

- **Goals as runtime state.** A "goal" tracked in agent memory or external state isn't a substrate goal — it's not auditable, not federate-able, not replayable.
  Per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), goals must be substrate predications.
- **Goal completion without explicit criterion.** A goal that "completes when the agent decides" lacks structural completeness — the agent's decision is itself a substrate operation that should be recorded.
  The completion-criterion makes the substrate's notion of "done" auditable.
- **Goals exceeding owner authority.** Per [agent-self-queueing-bounded-by-modal-restriction](../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md), goals' derived work-items are bounded by the owner's capability.
  A goal whose parameters require authority the owner doesn't have produces work-items that fail the bounded-autonomy check.
- **Goals without expiry policy.** A goal with `expiry-ordinal: null` runs indefinitely, which may be appropriate (e.g., `monitor-metric`) but should be explicit.
  The substrate's discipline is to require explicit policy on long-running goals.

## Position

Goals are the substrate's *intentional primitive* — what an agent (or user) *wants*, distinct from what they *do* to achieve it.
Per [agent-self-queued-work](../agent/agential-self-generation/agent-self-queued-work/agent-self-queued-work.md), agents queue work-items; per this concept, agents *also* queue goals, and closure rules translate goals into work-items.
The chain goal → work-item → dispatch → execution → output → next-iteration-goal is the substrate's full intentional loop.

The concept composes with [agent-self-queued-work](../agent/agential-self-generation/agent-self-queued-work/agent-self-queued-work.md) (the work-items goals derive into), with [work-item](../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/work-item.md) (the substrate's unit of pursuable work), with [opportunistic-scheduling-loop](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/opportunistic-scheduling-loop.md) (the scheduler that picks goals' derived work-items), with [agent-self-queueing-bounded-by-modal-restriction](../../../notes/undated/agent-self-queueing-bounded-by-modal-restriction.md) (the bound on goals' authority), with [work-graph](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/work-graph.md) (the structural tree of goals + sub-goals + work-items), and with [user-decision](../user-decision/user-decision.md) (user-decisions can also create goals — "I want this thing done").
