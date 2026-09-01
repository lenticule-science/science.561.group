---
title: "Milestones"
description: "Per-release work-orchestration records for the pypredcomp OS — one milestone per OS release v0.1 → v1.0 plus the research sidebar."
kind: index
---


One milestone per OS release.
Each carries the goal, scope, ship targets, owned task IDs, and out-of-scope boundary.

Reading order matches the release order:

1. [v0.1 — Substrate boots](v0.1-substrate-boots.md) — `done` (shipped on `main`).
2. [v0.2a — Multi-user single-node](v0.2a-multi-user-single-node.md) — `active`. **Active milestone.**
3. [v0.2b — Drivers, observability, packaging-prep](v0.2b-drivers-observability-packaging.md) — `planning`, sequenced after v0.2a ships.
4. [v0.3 — Bundled userland](v0.3-bundled-userland.md) — `planning`.
5. [v0.4 — Federation](v0.4-federation.md) — `planning`.
6. [v0.5 — Industrial control](v0.5-industrial-control.md) — `planning`.
7. [v0.6 — Application development surface](v0.6-application-development.md) — `planning`.
8. [v0.7 — 561 group productivity stack](v0.7-561-productivity-stack.md) — `planning`.
9. [v0.8 — Agential layer](v0.8-agential-layer.md) — `planning`.
10. [v0.9 — Continuous learning + publishing](v0.9-publishing-and-learning.md) — `planning`.
11. [v1.0 — Self-developing OS](v1.0-self-hosting.md) — `planning`.
12. [research-sidebar](research-sidebar.md) — `active`, parallel; conformance fixtures, not OS deliverables.

The original combined v0.2 plan is preserved at [v0.2-os-class.md](v0.2-os-class.md) with `status: superseded` per [decisions/v0.2-split-into-v0.2a-and-v0.2b.md](../decisions/v0.2-split-into-v0.2a-and-v0.2b.md).

## Per-release self-test

Each release's OS image self-tests the previous releases' conformance vectors at boot.
A v0.4 image runs v0.1 – v0.4 vectors at boot.
Failures block the boot sequence past `initializing`; the runtime stays in `degraded`.

## Decomposes into

Outcomes appear under [goals/](../goals/); leaf executable units appear under [tasks/&lt;area&gt;/](../tasks/).

## Theory grounding

The milestone kind is the *cadence-bearing* layer of the work hierarchy; per [predicated-work](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md):

- Milestones realise [cadence](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/cadence.md) and [cadence-as-modal-frame](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/cadence-as-modal-frame.md): the v0.1 → v1.0 sequence is a cadence, and each milestone is a modal frame inside which goals settle.
  The release window is the modal-frame interpretation of "what counts as ready *for this milestone*".
- The release-ordering — v0.1 settles, v0.2a opens, v0.2a settles, v0.2b opens, etc. — is [cadence-as-step-shift-rg-flow](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/cadence-as-step-shift-rg-flow.md): each release closure step-shifts the rg-flow forward, and the next milestone runs at the post-shift fixed-point.
  Skipping a milestone (per the campaign's flexibility rules) is a permitted shift over a vacuous frame.
- The "Per-release self-test" — every release's image self-tests every prior release's conformance vectors at boot — is [audit-as-cech-resolution-of-operations-settling](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/audit-as-cech-resolution-of-operations-settling.md): the boot-time vector run resolves the inconsistency sheaf over the cover {prior-releases}; a failed vector reads as a non-trivial Čech 1-cocycle that blocks settling past `initializing`.
- The conformance gate that licenses shipping a milestone is [completion-as-quiescence](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/completion-as-quiescence.md) at milestone scope: a milestone is shippable iff its predicate column has quiesced, *not* iff a status field has been set.
- The research-sidebar — "active, parallel; conformance fixtures, not OS deliverables" — is [regime-of-recurrent-practice](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/regime-of-recurrent-practice.md): the sidebar runs as a recurrent-practice regime alongside the milestone cadence rather than a regime-of-task instance, which is why it is not gated by any single milestone's ship target.
