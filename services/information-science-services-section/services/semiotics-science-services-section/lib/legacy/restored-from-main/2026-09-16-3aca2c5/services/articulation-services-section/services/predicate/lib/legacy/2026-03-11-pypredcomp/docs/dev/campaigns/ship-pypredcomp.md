---
title: "Campaign: ship pypredcomp"
description: "The multi-month initiative that delivers the predicated-computing operating system in versioned releases v0.1 through v1.0. Groups every milestone of the dev project."
kind: campaign
status: active
opened: 2026-05-03
owned-by-office: office:engineering
of-objective: objective:run-the-561-group-os
horizon: doing
completion-percent: 0.0
---


## What this campaign does

Delivers the OS specified in this dev project as a sequence of versioned, demoable releases.
Each release is a milestone with its own conformance gate; every release's image self-tests every prior release's vectors at boot per [milestones/_index.md](../milestones/_index.md).

## Scope

Every milestone v0.1 → v1.0 listed in [milestones/_index.md](../milestones/_index.md).
The research sidebar (Predicated Zork, Hevî Mala, world-sim, paracosms, Voidfleet Academy) is **not** part of this campaign — those artefacts run on the OS but are not OS components; they appear as conformance fixtures, not release deliverables.
See [milestones/research-sidebar.md](../milestones/research-sidebar.md).

## Milestones (in execution order)

1. **[v0.1 — Substrate boots](../milestones/v0.1-substrate-boots.md)** — `done`.
  Kernel real; substrate boots; messages accepted over MCP and HTTP; 163-test suite passes.
2. **[v0.2a — Multi-user single-node](../milestones/v0.2a-multi-user-single-node.md)** — `active`.
  Kernel surfaces shipped; multi-user authoring; capability fibers; per-stratum projection; bootstrap-users + fiber-cache reconcile.
3. **[v0.2b — Drivers, observability, packaging-prep](../milestones/v0.2b-drivers-observability-packaging.md)** — `planning`, sequenced after v0.2a ships.
  Driver model; observability + governance; Nix-flake skeleton; stdlib verb specs; network stubs.
4. **[v0.3 — Bundled userland](../milestones/v0.3-bundled-userland.md)** — `planning`.
  Mail, calendar, chat, file browser, text editor, terminal, calculator, ledger.
  Daily-driver-ready.
5. **[v0.4 — Federation](../milestones/v0.4-federation.md)** — `planning`.
  Multi-node sovereign operation; ActivityPub edge; Matrix S2S; selective sync; trust graphs.
6. **[v0.5 — Industrial control](../milestones/v0.5-industrial-control.md)** — `planning`.
  MQTT, Modbus, sensor framework; outpost model; first physical binding.
7. **[v0.6 — Application development surface](../milestones/v0.6-application-development.md)** — `planning`.
  SDK, capabilities-as-API, package authoring, doc format, third-party workflow.
8. **[v0.7 — 561 group productivity stack](../milestones/v0.7-561-productivity-stack.md)** — `planning`.
  Tasks, knowledge, governance, dispatch, fleet, review apps.
9. **[v0.8 — Agential layer](../milestones/v0.8-agential-layer.md)** — `planning`.
  Sessions as OS-level processes; persona-agents; offices; Voidfleet Academy; Tier-2 invocation; bundled MCP catalog wired in.
10. **[v0.9 — Continuous learning + publishing](../milestones/v0.9-publishing-and-learning.md)** — `planning`.
  Observation → instinct → skill → tool → hook; Tier-2 training surface; Hugo-style publishing.
11. **[v1.0 — Self-developing OS](../milestones/v1.0-self-hosting.md)** — `planning`.
  Agents inside the OS write OS code; 30 consecutive days of self-development.
12. **[research-sidebar](../milestones/research-sidebar.md)** — `active`, parallel.
  Research artefacts running on the OS as conformance fixtures.

## Sequencing flexibility

Per the milestone records:

- v0.1 and v0.2a/v0.2b MUST execute in order; the OS must boot and self-host before any dependent work.
- From v0.6 onward (SDK exists), app work and OS work MAY proceed in parallel.
- A milestone MAY be skipped if its features are not yet needed (e.g., v0.5 if no hardware is wired up).
- A milestone MAY be deferred if it depends on an unresolved captain-question in [questions/](../questions/).

The agent MUST NOT ship a milestone without its conformance gate passing.

## Release-shipping discipline

Per [milestones/_index.md](../milestones/_index.md), each release's OS image self-tests every prior release's conformance vectors at boot.
Failures block the boot sequence past `initializing`; the runtime stays in `degraded`.

## Theory grounding

The campaign is the *plan-shaped* projection of [objectives/run-the-561-group-os.md](../objectives/run-the-561-group-os.md) onto the milestone-paced layer; per [predicated-work](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md):

- The campaign realises [plan-as-tensor-of-task-cobordisms](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/plan-as-tensor-of-task-cobordisms.md): the milestone sequence v0.1 → v1.0 is the tensor product of per-milestone task-cobordisms in execution order.
  The "Sequencing flexibility" rules above (some milestones MUST be ordered, others MAY parallelise from v0.6) are exactly the tensor's commutativity profile — sequential factors compose strictly, parallel factors compose tensorially.
- The release ordering — each milestone's deliverables enable the next milestone's hypotheses — is [workflow-composition](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/workflow-composition.md) at campaign scope; this is the same theorem `implementation/capability-ladder.md` makes operational at the rung scope.
- The "Per-release self-test" discipline (every release's image self-tests prior conformance vectors at boot) is [audit-as-cech-resolution-of-operations-settling](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/audit-as-cech-resolution-of-operations-settling.md): the boot-time conformance run is the Čech resolution of operations-settling over the release-cover, computing whether the new image preserves prior settlings.
- The frontmatter `completion-percent` field rolls up via [plan-completion-as-meet](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/plan-completion-as-meet.md) — the bilattice meet of constituent milestone completions; it is *not* a stored field but a query derived from the milestones' settled state per [completion-as-quiescence](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/completion-as-quiescence.md).
- The "agent MUST NOT ship a milestone without its conformance gate passing" rule is the operational form of [completion-as-quiescence](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/completion-as-quiescence.md) at milestone scope: shipping is licensed only when the milestone's predicate column has quiesced.

## Decomposes into

The goal records under [goals/](../goals/) decompose each active milestone into outcome statements. v0.2a and v0.2b have multiple goal records each (kernel-frozen; multi-user-authoring; observability; etc.); far-horizon milestones carry a single coarse goal until activated.

## Owner

`office:engineering` — the engineering office that holds the implementation; captain holds final review at every milestone ship target per [charter.md](../charter.md) §"Decision authority".

## Status

`active` — campaign is open; one milestone is `done`, one `active`, ten `planning`/`active`.
