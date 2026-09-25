---
name: heartbeat-record
description: Heartbeat record
type: definition
class: record
instantiates: [heartbeat, heartbeat-scheduler]
depends-on: [tick-as-iteration, declared-dependency-ordering, fiber, scope]
see-also: [advance-tick, heartbeat-cycle, closure-rule-system]
title: heartbeat-record
---

# Heartbeat record

The substrate-record carrying one heartbeat scheduler: the substrate-resident entity whose fiber declares the scheduler's *policy* (what kind of selection to perform), *cycle rate* (how frequently to tick), *scope* (which substrate region to operate on), and *registration* (which entities are currently selected for ticking).
A `HeartbeatRecord` is FARS's realization of AgOP's [heartbeat-scheduler](../../../heartbeat/heartbeat-scheduler/heartbeat-scheduler.md) at the bilattice value-domain.

A `HeartbeatRecord` is itself a substrate entity — per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), even the iteration machinery is substrate content.
Editing the heartbeat's policy is editing predications; modifying its cycle rate is editing predications; pausing or retiring the heartbeat is a substrate edit per [`apply-edit`](../transformers/apply-edit.md).

Two heartbeats running at two scopes are two distinct `HeartbeatRecord`s with their own policies; they do not contend for the same registered entities.
A FARS substrate MAY have many heartbeats — one root-scope heartbeat plus per-department heartbeats for finer-grained scheduling, for example — and the substrate's coherence does not depend on global synchronization across them.

## Required fields

Every conforming realization SHALL hold, for each `HeartbeatRecord`:

- **`name`** — canonical identifier (e.g., `root-heartbeat`, `engineering-heartbeat`, `learning-heartbeat`).
- **`scope`** — predication pattern declaring which substrate region this heartbeat operates over.
  May be substrate-wide, department-bounded, or context-bounded.
  Two heartbeats with overlapping scopes MAY co-exist; the overlap region is ticked by both, with their conclusions composing under [`compose`](../morphisms/compose.md).
- **`policy`** — the selection-and-ordering policy.
  A predication-bundle describing how the heartbeat selects entities from the candidate set and orders the cycle's ticks.
  Common policies:
  - `round-robin` — selects all registered entities equally, orders by canonical hash.
  - `priority-weighted` — selects entities weighted by a priority predicate.
  - `formality-weighted` — selects entities weighted by formality (F0–F3 from the AgOP offices-and-governance analysis), preferring lower-formality (more uncertain) entities for proactive monitoring.
  - `bilattice-value-weighted` — selects entities by a value-domain projection of their fiber state ($\top$-cell count, unsettled-cell count, etc.).
  - Realizations MAY define additional policies; the policy itself is substrate content.
- **`cycle-rate`** — the cadence at which cycles run.
  May be a frequency (e.g., `1Hz`, `1/60s`, `every-minute`), an event trigger (`on-substrate-edit`, `on-message`), or `on-demand` (cycles run only when an operator explicitly invokes [`heartbeat-cycle`](../transformers/heartbeat-cycle.md)).
- **`closure-rule-system`** — the [`ClosureRuleSystem`](closure-rule-system.md) version this heartbeat uses for its tick rule applications.
  Citing a specific version pins replay determinism.
- **`fuel-per-tick`** — bound on iteration layers per tick.
  Single-tick fuel; cycle-level fuel is computed as `fuel-per-tick × selected-count` plus an overhead.
- **`registration-snapshot`** — optional cached set of entity addresses currently registered.
  Derived from the scope's entities' fiber states (an entity is registered iff its fiber has unsettled cells under the rule system).
  Realizations MAY maintain the snapshot for cycle efficiency; per [source-of-truth](../../../../teaching/explanations/source-of-truth.md), fiber states are authoritative and the snapshot is regenerated on substrate edits.
- **`description`** — human-readable note.
  Provenance only.

## Invariants

- **Substrate entity.** A `HeartbeatRecord` SHALL be a substrate entity addressable like any other; its policy, cycle rate, scope are predications.
- **Policy-tunable.** The `policy` SHALL be replaceable by editing the record.
  Per [`apply-edit`](../transformers/apply-edit.md), the edit is a substrate event; subsequent cycles use the new policy; replay reconstructs both pre- and post-edit cycles deterministically.
- **Computed registration.** Registration is *derived* from substrate content, not declared.
  An entity is on the heartbeat's selection set when its fiber has any unsettled cell under the rule system, and off when every cell is at fixed-point.
  The discipline is what makes "entities with remaining work get processing time; entities without don't" operational without the heartbeat tracking entity-side state.
- **Witness-recorded.** Every cycle SHALL produce one cycle-witness aggregating the per-tick witnesses of the cycle's selected entities.
  Per [`heartbeat-cycle`](../transformers/heartbeat-cycle.md), the witness is what makes a cycle replayable.
- **Scope-bounded.** A `HeartbeatRecord`'s ticks SHALL operate only on entities matching its scope.
  Cross-scope ticking is not admissible at a single heartbeat; cross-scope coordination uses [federation](../../teaching/explanations/federation.md) between heartbeats or two heartbeats whose scopes overlap.
- **Per-entity intervals admissible.** A heartbeat MAY honor per-entity cycle-rate predicates (e.g., an entity carrying `tick-interval: 60s` is selected only every minute even if the heartbeat's base cycle rate is faster).
  The LPMud `set_heart_beat()` pattern is the precedent.

## What a `HeartbeatRecord` is not

- **Not the iteration code.** A `HeartbeatRecord` is the *substrate-resident statement* of the scheduler's policy and state.
  The actual iteration machinery (the loop, the per-tick dispatch) is the realization's stepping map per [four-layer-rule-architecture](../../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md).
- **Not a global clock.** A `HeartbeatRecord` declares its own cycle rate; the substrate has no shared global clock.
  Two heartbeats running at different rates are independent.
- **Not a queue.** Registered entities are not "pending work" in a queue sense.
  Registration is computed each cycle from the substrate's state; the heartbeat does not maintain a separate to-do list.

## Position

`HeartbeatRecord` is the substrate-level statement of "this scheduler exists, with this policy, at this scope, over this rule system, at this cadence."
It is what makes [tick-as-iteration](../../tick-as-iteration/tick-as-iteration.md) operational beyond a single tick: the iteration's bounds, ordering, and rate are all readable from substrate content.

The object composes with [`closure-rule-system`](closure-rule-system.md): the heartbeat cites the rule-system version it ticks against; the rule system's content determines what the ticks accomplish.
The two together pin the heartbeat's behavior without the heartbeat needing internal state beyond its `registration-snapshot` cache.
