---
title: "Inbox as top-level OS surface vs. per-session widget"
description: "The inter-session messaging substrate plumbing ships at v0.2a (t02-140..145); the v0.3 UI work (t03-90, t03-91) needs a captain decision on whether the inbox is its own OS-level shell surface or a per-session widget."
kind: question
status: resolved
opened: 2026-05-02
opened-by: agent
resolved: 2026-05-03
resolved-as: "Option 3 — both /inbox aggregator AND /sessions/<id>/inbox per-session view, sharing one projection."
resolved-by: "agent (industry default; captain directive 2026-05-03)"
---

> **Resolved 2026-05-03 (industry default).** Every modern > messaging UX (Slack, Discord, Gmail, every mobile OS > notification centre) ships BOTH a top-level cross-context > aggregator AND a per-context view, both projecting from the > same underlying message store.
There is no precedent for > picking one and rejecting the other; doing so would require > the operator to either lose cross-session visibility or lose > per-session focus.
`t03-90` and `t03-91` ship the per-session > widget; v0.3 also adds `/inbox` (web GUI) and a top-level TUI > shell binding (e.g. `g i`) projecting across every session the > operating boundary owns or co-attends.
Captain may overrule. ---

# Inbox as top-level OS surface vs. per-session widget

## Context

The substrate-side inter-session messaging machinery is owned by [v0.2a-multi-user-single-node.md](../milestones/v0.2a-multi-user-single-node.md) task family `t02-140..
145` per [specs/process/inter-session-messaging.md](../specs/process/inter-session-messaging.md) and [decisions/inter-session-messaging-is-substrate-cells.md](../decisions/inter-session-messaging-is-substrate-cells.md).
The v0.3 user-facing inbox UI is owned by `t03-90` (TUI shell panel) and `t03-91` (web GUI shell route at `/sessions/<id>/inbox`).
The current v0.3 plan implicitly assumes the **per-session widget** shape — the inbox is rendered inside the session shell, scoped to the focused session.

Project-task pt-09 records the captain's open consideration of an alternative: the **top-level OS surface** shape, where the inbox is a focusable shell surface in its own right (route `/inbox` in the web GUI, dedicated key-binding in the TUI), aggregating unread messages across every session the operating boundary owns or co-attends.

## The question

Should the inbox at v0.3 ship as:

1. **Per-session widget only** — `/sessions/<id>/inbox` only; the operator picks a session, then sees its inbox.
  (Current implicit plan.)
2. **Top-level OS surface only** — `/inbox` only, aggregating across sessions; sessions individually do not have an inbox surface, only a "messages" feed within their own UI.
3. **Both** — `/inbox` (cross-session aggregation) plus `/sessions/<id>/inbox` (per-session focus).
  The two surfaces share the same projection over the inter-session-messaging substrate.

## Trade-offs

- **(1) per-session widget only.** Simpler v0.3; fewer routes; closer to the substrate's per-session attribution.
  But: fragmented attention surface — to triage all unread messages, the operator must walk every owned session.
- **(2) top-level OS surface only.** Cleanest attention model; one inbox to triage.
  But: hides the session context; the operator clicks through to the session anyway, and the round-trip is wasted work.
- **(3) both.** The right shape long-term per the substrate's projection naturality (the same fiber projected at two scopes).
  But: doubles the v0.3 UI surface area; needs a coherent affordance for "open this message in its session" navigation.

## Agent's lean

**(3) both.** Rationale:

- The substrate fiber `(boundary:<id>, has-unread-message, *)` already exists (the cross-session projection); `(session:<id>, has-unread-message, *)` is the per-session restriction.
  Both projections are natural in the boundary/session inclusion functor; rendering both is just exposing both projections.
- The v0.3 captain-daily-driver use case strongly favours one focusable triage surface; the per-session view remains useful when the operator is already in a session and wants to see only its messages.
- Implementation cost is bounded: same renderer, two routes, one shared subscription.

But the agent **does not implement** until the captain rules.
The v0.3 plan keeps the per-session widget (`/sessions/<id>/inbox`) as the implicit default; adding `/inbox` is conditional on this answer.

## Captain's answer

(awaiting)
