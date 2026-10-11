---
title: "pypredcomp dev project"
description: "Dev docs for the Python implementation of the predicated-computing OS substrate. Charter, decisions, specs, plans, tasks."
kind: project-index
status: open
---

# pypredcomp dev docs

Dev project for [`pypredcomp`](../../README.md), the Python implementation of the 561 group's predicated-computing OS.
Design records live here; source lives in `../../src/`.
Code cites the spec it implements via module docstrings (e.g. `specs/kernel/canonicalization.md`).

## Right now

**In flight: L1 — Personnel → boundary migration.** One pull-request-shaped piece of work; full procedural recipe at [implementation/next-stretch-now.md §L1](implementation/next-stretch-now.md#l1--personnel--boundary-migration).

**Queue behind L1:** L2 (multi-user authoring scaffolding) sequential after L1; L3 (H¹ audit surface) and L4 (fuel-composition determinism) parallel-eligible after L1.
All four close into [v0.2a shipping](milestones/v0.2a-multi-user-single-node.md), then [v0.2b picks up](milestones/v0.2b-drivers-observability-packaging.md).

## How to pick it up

1. Read [pypredcomp/AGENTS.md](../../AGENTS.md) — what counts as a real landing, what's anti-pattern.
  Once.
2. Open [implementation/next-stretch-now.md](implementation/next-stretch-now.md) — find your landing, follow the ordered moves keyed to source modules.
3. When you hit a recipe question ("how do I write a paired fixture?", "how do I debug projection divergence?"), jump to [implementation/workflows.md](implementation/workflows.md).
4. When the theorem grounding for a step is unclear, jump to [references/theory-for-developers.md](references/theory-for-developers.md).

Multi-stage stretch view across releases is in [implementation/next-stretch.md](implementation/next-stretch.md) (v0.2a → v0.2b → v0.3) and its v0.4-v0.6 / v0.7-v1.0 continuations.
Read those when scoping work whose horizon extends past a single landing.

For a single canonical view of the **build-X-to-enable-Y forward chain across all releases** — every rung from L1 today to v1.0 self-development, with theorem authorisation and captain-trove reduction per rung — open [implementation/capability-ladder.md](implementation/capability-ladder.md).
It's the dependency-graph view of the same content the next-stretch docs organise by release.

## Where things are

| Dir | What's in it |
|---|---|
| [charter.md](charter.md) | What we're building and why. |
| [decisions/](decisions/) | ~50 captain decisions every implementation inherits. |
| [specs/](specs/) | OS subsystem specs (kernel, filesystem, network, process, drivers, shell, stdlib, init-boot, packaging, security, scheduling, bundled-apps, work-orchestration). |
| [milestones/](milestones/) | Per-release execution records, v0.1 → v1.0. |
| [goals/](goals/), [tasks/&lt;area&gt;/](tasks/) | Outcomes and leaf tasks under active milestones. |
| [backlog/{soon,later,captured,done}/](backlog/) | Horizon-graded backlog. |
| [questions/](questions/) | Open items for the captain. |
| [implementation/](implementation/) | Per-language guides (python, rust) and procedural [workflows](implementation/workflows.md). |
| [references/](references/) | Theory chain, [theory→code translation for developers](references/theory-for-developers.md), RFCs, vocabulary translation. |
| [texts/](texts/) | Charter-adjacent prose: vision, scope, roadmap, Unix↔substrate analogue. |
| [surveys/](surveys/) | Periodic state-of-the-project audits. |
| [_conventions.md](_conventions.md) | Where records go and what `status`/`horizon` mean. |

## Source-of-truth ordering

Lowest to highest authority:

1. Math theory: `library/.../predication-categories/`
2. Engineering theory: `library/.../predicated-computing/`
3. These dev docs: `specs/`, `decisions/`
4. Code: `../../src/`

When sources disagree, the lower one wins.

## What this is not

This dir specifies the OS, not apps that run on it. **Out of scope:** Predicated Zork, world-sim, Hevî Mala, paracosms, persona-agents, Voidfleet Academy (research content; runs *on* the OS), and the 561 group's productivity stack as full apps (per-app design lives in each app's own project directory at v0.7+).
