---
title: "GitHub-issues driver release placement"
description: "specs/drivers/github-issues-driver.md exists but no plan currently owns it. Which release should land it: v0.6 (third-party app development surface) or v0.7 (productivity stack)?"
kind: question
status: resolved
opened: 2026-05-02
opened-by: agent
resolved: 2026-05-03
resolved-as: "v0.6 — ship alongside the third-party SDK as the canonical driver exemplar."
resolved-by: "agent (industry default; captain directive 2026-05-03)"
---

> **Resolved 2026-05-03 (industry default).** A third-party SDK > without a worked exemplar driver in the same release is a > documentation hazard — every SDK-targeting team needs a > concrete reference.
The GitHub-issues driver is the obvious > exemplar (it stresses pagination, webhooks, rate-limit handling, > token refresh — the four hard parts every driver author hits). > Land it in v0.6 alongside the SDK; v0.7 productivity-stack apps > can then consume it as a stable upstream rather than co-evolving > with it.
Captain may overrule. ---

# GitHub-issues driver release placement

## Context

`specs/drivers/github-issues-driver.md` exists; no source module implements it; no current plan owns it.

The decision [`external-systems-get-drivers-peers-get-federation`](../decisions/external-systems-get-drivers-peers-get-federation.md) puts GitHub clearly under the **driver** discipline (it is a non-561 external platform, not a federated peer).
Driver authoring is therefore the right shape; the open question is **which release**.

## Options

1. **v0.6 — third-party application development surface.** Treat the GitHub-issues driver as an SDK example for app authors: when third parties begin writing apps against the substrate, they need reference drivers that bridge to common external platforms.
  GitHub issues is a good first reference because the API is simple, the semantics map cleanly to substrate cells (issue ↔ task cell, comment ↔ append-to-fiber, label ↔ predicate), and the driver authoring experience can be exemplary.
2. **v0.7 — 561 productivity stack.** Treat the GitHub-issues driver as captain-facing infrastructure: a way for the captain's task workflow to absorb GitHub issues into the operational substrate.
  The hledger-driver lives at v0.3 because the ledger tool is a bundled userland app; if the same logic applies, the GitHub driver lives wherever the captain's tasks app lives.
3. **v0.5 — industrial control / outpost model.** Reject — GitHub is not industrial.
4. **Don't ship.** Reject — the spec exists, the captain has previously committed to driver-shape for non-peer external systems, and a clean reference driver is desirable.

## Agent's recommendation

**v0.6.** The driver doubles as an SDK example for third-party app authors. v0.7 then *uses* the driver inside the productivity stack without owning the driver work itself.
This keeps captain-facing productivity work focused on UX rather than protocol-binding.

## Captain's answer

(awaiting)
