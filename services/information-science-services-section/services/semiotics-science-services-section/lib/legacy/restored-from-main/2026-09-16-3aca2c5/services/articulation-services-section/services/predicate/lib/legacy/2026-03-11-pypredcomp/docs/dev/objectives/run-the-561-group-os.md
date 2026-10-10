---
title: "Objective: run the 561 group's operating system"
description: "Multi-year top-of-hierarchy outcome: the 561 group runs its sovereign daily operations on an operating system whose kernel is the predicated-computing substrate. The captain runs the ship from this OS; agents inside the OS develop the OS."
kind: objective
status: active
opened: 2026-05-03
owned-by-office: office:captain
of-project: pypredcomp-dev
horizon: doing
---


## Outcome statement

The 561 group operates a real, bootable, federated operating system whose kernel is the predicated-computing substrate.
The captain runs daily ship operations through it: email, calendar, chat, ledger, dispatch, knowledge, governance, fleet, review, publishing.
Persona-agents publish under their own names through the OS.
Industrial control bindings (sensors, actuators) flow through the OS.
Confederate 561 peers federate with the captain's node under the substrate's algebraic merge discipline.
Agents inside the OS write the OS's own code.

Per [charter.md](../charter.md), the OS is **not** an application that runs on Linux; it is an operating system.
Plan 9 specified 9P, fossil, venti, plumber, factotum, rc, sam, acme.
We specify the OS at that level for the predicated substrate.

## Key results

- KR-1 — A Nix-built OS image boots cleanly on commodity hardware and reaches `ready` state. *(Achieved at v0.1; see [milestones/v0.1-substrate-boots.md](../milestones/v0.1-substrate-boots.md).)*
- KR-2 — Multi-user single-node operation with capability discipline; per-stratum projection materialisation; inconsistency-repair lifecycle. *(In progress at v0.2a.)*
- KR-3 — A daily-driver-replacement bundled userland (mail, calendar, chat, file browser, text editor, terminal, calculator, ledger). *(Targeted v0.3.)*
- KR-4 — Two 561 nodes federate under signed Ed25519 events; ActivityPub edge to the wider fediverse; Matrix S2S federation. *(Targeted v0.4.)*
- KR-5 — The captain's first physical binding (sensor → closure rule → notification → ledger entry) runs end-to-end. *(Targeted v0.5.)*
- KR-6 — A non-561 third-party developer follows documented onboarding to ship a working app on the OS. *(Targeted v0.6.)*
- KR-7 — The captain accomplishes a full week's work using only the productivity stack on the OS. *(Targeted v0.7.)*
- KR-8 — Persona-agents (Cassia Lorne, Calder Underhill, Josh Blevins, etc.) author content under their own names through the OS. *(Targeted v0.8.)*
- KR-9 — The continuous-learning pipeline promotes one observation through `instinct → skill → tool → hook` under captain review. *(Targeted v0.9.)*
- KR-10 — Agents inside the OS write OS code; 30 consecutive days of self-development without external dev tools. *(Targeted v1.0.)*

## Theory grounding

Per [_index.md](../_index.md) §"Theory the OS implements", the objective inherits the full predicated-computing theory chain.
The OS's authority to exist as a coherent design is the chain:

- [predication-categories](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md) — the math.
- [predicated-computing](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md) — the engineering theory.
- The seven downstream platform theories (agential-orchestration, flatfile-agentic-resource-system, functional-runtime, interactive-application, web-server, database, distributed-coordination).

### Work-theory grounding

The objective's *shape* — a multi-year outcome decomposed into key results that are themselves outcome predicates rather than terminating tasks — is grounded in [predicated-work](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/_index.md):

- An objective is an instance of [aim-generativity](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/concepts/aim-generativity.md) — the work it organises is structured around an aim that itself generates downstream work, not around a terminating task list.
  KR-1 through KR-10 are not subtasks of the objective; they are aim-generative settlings whose closure produces *more* work (more federation peers, more apps, more bindings) rather than emptying the work surface.
- The coherence of a multi-year objective with no fixed-period termination is [aim-generativity-iff-aperiodic](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/theorems/aim-generativity-iff-aperiodic.md): an aim-generative objective is *necessarily* aperiodic.
  If this objective ever became periodic (e.g., reduced to a calendar release cycle that closed at vN.
  0 with nothing further generated) it would lose aim-generativity and reduce to a campaign.
- Decomposition into the campaign is the objective-scope instance of [lift-task-to-plan](../../../../../../../../theories/humanities/theories/sociology/theories/work/theories/predicated-work/morphisms/lift-task-to-plan.md) — the campaign is the plan-shaped projection of this objective onto the milestone-paced layer.

## Decomposes into

- **[campaigns/ship-pypredcomp.md](../campaigns/ship-pypredcomp.md)** — the multi-month initiative that delivers each release of the OS.

## Decision authority

The captain ([office:captain](../decisions/)) holds final authority on every release scope, every decision, every ship target.
Per [charter.md](../charter.md) §"Decision authority" the captain is the sole architectural decision-maker; the agent executes.

## Cadence

The current cadence is **release-driven**.
Each release is its own milestone; the active milestones (v0.2a → v0.2b) run on a sprint-and-ship cadence (~3 weeks → ship target → next).
Far-horizon milestones (v0.3 → v1.0) carry their own scope and gates; their cadence will be set when they activate.

## Status

`in-progress` — v0.1 complete and shipped on `main`; v0.2a is the active milestone. v0.2b ships after v0.2a. v0.3 → v1.0 are scoped but not yet activated.
