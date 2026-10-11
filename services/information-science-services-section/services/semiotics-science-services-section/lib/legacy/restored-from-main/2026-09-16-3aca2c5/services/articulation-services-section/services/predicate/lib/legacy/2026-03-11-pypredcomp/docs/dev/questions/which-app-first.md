---
title: "Which app first?"
description: "Plan 07 lands the first app projection. The captain picks among chat, ledger, tasks, knowledge."
kind: question
status: open
---


After Inflection 1 (substrate-only), the project lands its first real app projection.
Multiple candidates fit:

## Candidates

- **Chat** ([apps/chat.md](../specs/apps/chat.md)) — visible immediately, easy to demo, validates messaging primitives.
  Could federate via Matrix early.
- **Ledger** ([apps/ledger.md](../specs/apps/ledger.md)) — replaces hledger CLI workflow.
  The captain has years of hledger files to import; high day-one value.
  Validates σ/Δ structure deeply.
- **Tasks** ([apps/tasks.md](../specs/apps/tasks.md)) — the captain authors plans here.
  High utility for managing the system itself; meta-bootstrap value.
- **Knowledge** ([apps/knowledge.md](../specs/apps/knowledge.md)) — the library import is large (~11k entities); validates fiber projection at scale; lower interactivity than the others.

## Trade-offs

- **Chat is fastest to demo.** A textarea, a record stream, a closure rule.
  But it's "yet another chat app" from the outside without federation.
- **Ledger is highest immediate-utility.** Captain replaces a CLI workflow.
  But it requires the chart-of-accounts import and the hledger interfacer — substantial pre-work.
- **Tasks gives the most bootstrap leverage.** The system manages its own tasks; subsequent app work flows through it.
  But it requires solid dispatch even for the simple case.
- **Knowledge proves scale.** 11k entities exercise the fiber map; the captain gets a real graph browser.
  But it's mostly read-heavy, doesn't validate write paths.

## Captain's view

(To be written by the captain.)

## Resolution

Once decided, the chosen-app commitment is recorded in the corresponding [milestones/](../milestones/) record.
The corresponding spec is read fully; tasks are sequenced.

## Options

The four candidates as captain-decidable options, scored on substrate-validation surface, captain day-one utility, pre-work cost, and v0.4-federation alignment.
Default disposition: `defer-to-v0.3-bundled-app-priority` ([`v0.3-bundled-app-priority.md`](v0.3-bundled-app-priority.md) carries the eight-app sequencing within v0.3 once the first-app pick is made).

### Option A — chat first

A `respond`-driven chat surface over message cells; per-room append; reads-as-fiber per [`process/inter-session-messaging.md`](../specs/process/inter-session-messaging.md).

- **Substrate-validation surface.** Validates message-as-cell, room-as-fiber, and the per-session output-streaming surface (§16 of [`specs/conformance-vectors.md`](../specs/conformance-vectors.md)).
- **Captain day-one utility.** Demoable immediately; no pre-existing data dependency.
  Without federation it is "yet another chat app" externally.
- **Pre-work cost.** Lowest.
  No import; no chart-of-accounts; no library re-projection.
- **v0.4 federation alignment.** Highest of the four — chat is the canonical federation-receive consumer; chat-first composes naturally with [`specs/network/federation-protocol.md`](../specs/network/federation-protocol.md) and the round-4 [`specs/network/network-algebraic-contract.md`](../specs/network/network-algebraic-contract.md).
- **Best when.** The captain wants the fastest demoable substrate surface and is willing to forego day-one utility-replacement.

### Option B — ledger first

A `respond`-driven ledger surface over posting cells; chart-of-accounts as substrate cells; hledger-format I/O via interfacer.

- **Substrate-validation surface.** Validates σ/Δ deeply (postings as $\top$-resolution under double-entry); per-account fibers; the [`accounting-render-as-hledger`](../decisions/accounting-render-as-hledger.md) interfacer's faithful-counit discipline.
- **Captain day-one utility.** Highest — the captain replaces a CLI workflow and imports years of hledger files on day one.
- **Pre-work cost.** Highest.
  Chart-of-accounts import; hledger interfacer; per-account fiber discipline; the import is paired-fixture per [`fixture-authoring-paired-task`](../decisions/fixture-authoring-paired-task.md).
- **v0.4 federation alignment.** Adequate — ledger postings federate as standard cells; no special protocol surface needed.
- **Best when.** The captain values immediate utility-replacement over fastest-demo and is willing to fund the import pre-work.

### Option C — tasks first

A `respond`-driven task surface over the work-orchestration spec the dev project itself uses ([`specs/work-orchestration/`](../specs/work-orchestration/)); plan/goal/task records as substrate cells; rollup as fold per round-3 §1.14.

- **Substrate-validation surface.** Validates the work-orchestration record-shape contract end-to-end; rollup-as-fold under bilattice; the dispatch shell as the closure-rule activation surface per [`_patterns/closure-rule-activation.md`](../specs/_patterns/closure-rule-activation.md).
- **Captain day-one utility.** Highest *meta-utility*: the system manages its own task records; subsequent dev-project work flows through the surface; the dev-docs reorganization (task-67) becomes self-substrate-resident.
- **Pre-work cost.** Medium.
  Requires solid dispatch even for the simple case; the rollup-as-fold pattern is named but not authored (placeholder #6 — `predication-cell-as-fold-source`, v0.7).
- **v0.4 federation alignment.** Adequate — task records federate as standard cells; multi-node task assignment is a natural v0.4 demo.
- **Best when.** The captain prioritises bootstrap leverage (the substrate runs the substrate's own development).

### Option D — knowledge first

A `respond`-driven knowledge browser over the library import; ~11k entities as substrate cells; per-discipline fibers.

- **Substrate-validation surface.** Validates fiber projection at scale (the largest fiber in the substrate); the per-stratum projection question's read-pattern (see [`projection-materialisation-as-cell.md`](projection-materialisation-as-cell.md)); content-addressed cell density.
- **Captain day-one utility.** Read-heavy; the captain gets a real graph browser.
  Lower interactivity than A/B/C.
- **Pre-work cost.** Medium.
  The library import is paired-fixture (fidelity verifiable); per-discipline fiber projection is open via the projection-materialisation question.
- **v0.4 federation alignment.** Weakest — knowledge is mostly read-heavy and write-rare; federation surfaces less.
- **Best when.** The captain wants the substrate's scale-validation in front of an external observer (e.g., for collaborator onboarding).

### Comparison

| Dimension | A. chat | B. ledger | C. tasks | D. knowledge |
|---|---|---|---|---|
| Substrate-validation surface | message+fiber | σ/Δ + interfacer | dispatch + rollup-fold | fiber-at-scale |
| Captain day-one utility | demo only | replaces CLI | meta-bootstrap | read-only browse |
| Pre-work cost | lowest | highest | medium | medium |
| v0.4 federation alignment | best | adequate | adequate | weakest |
| Discipline preserved | message-cell | double-entry-as-σ/Δ | bilattice-fold-rollup | fiber projection |
| Western default refused | per-room state | per-account ledger row | per-task DB row | per-document store |

### Recommended-for-captain ordering

The agent's recommended evaluation order, **conditional on the captain's daily-utility versus federation-validation balance**:

1. **B (ledger)** if day-one utility is the priority and the captain is willing to fund the chart-of-accounts import.
  Highest captain return on the v0.3 first-app investment.
2. **A (chat)** if the captain wants the substrate's federation surface validated in front of v0.4.
  Lowest pre-work; aligns with v0.4.
3. **C (tasks)** if the captain wants the substrate to run its own development surface.
  Highest meta-leverage but demands solid dispatch.
4. **D (knowledge)** if the captain wants scale-validation and is willing to wait for a more interactive app to follow.
  Lowest immediate-utility ranking.

The agent does **not** recommend D as the first app: scale-validation is a v0.4 federation concern, and a read-only first app under-uses the substrate's write-path discipline.

### Cross-references

- [`projection-materialisation-as-cell.md`](projection-materialisation-as-cell.md) — option D's read-pattern interacts with the projection-materialisation captain-question.
- [`v0.3-bundled-app-priority.md`](v0.3-bundled-app-priority.md) — within-v0.3 sequencing of the eight bundled apps once the first-app pick is made.
- [`specs/apps/chat.md`](../specs/apps/chat.md), [`specs/apps/ledger.md`](../specs/apps/ledger.md), [`specs/apps/tasks.md`](../specs/apps/tasks.md), [`specs/apps/knowledge.md`](../specs/apps/knowledge.md) — the per-app spec stubs.
