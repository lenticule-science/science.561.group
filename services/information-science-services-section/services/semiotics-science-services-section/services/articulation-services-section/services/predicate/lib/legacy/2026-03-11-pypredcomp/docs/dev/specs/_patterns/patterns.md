---
title: "Substrate patterns"
description: "Cross-cutting patterns that recur across subsystems. Documented once; subsystem specs cite by reference."
kind: index
---

# Substrate patterns

These patterns recur across subsystem specs.
Rather than re-specifying them in each subsystem, this meta-section documents them once; subsystem specs cite by reference.

When you see a spec describing a substrate entity, an approval flow, an anomaly, a hierarchy, a time predicate, or a closure-rule activation, the pattern is what's underneath.
The math (PredCat grounding) explains why these patterns are forced.

## Patterns

- [substrate-entity-records.md](substrate-entity-records.md) — every "X-record" follows the same shape; common predicates; naming conventions.
- [principal.md](principal.md) — unified vocabulary for actors with capability fibers (system, personnel, office, persona-agent, peer, daemon, driver, session, agent).
- [approval-flow.md](approval-flow.md) — the unified approval pattern.
  Decision-record approval, spending-approval, promotion, performance-review, trust-scope-grant, capability-rotation, vote-tally — all reduce to this.
- [anomaly-as-contradiction.md](anomaly-as-contradiction.md) — anomalies are $\top$-valued cells at `anomaly:*` predicates.
  Detection, propagation, alerting, resolution.
- [hierarchy-and-supersession.md](hierarchy-and-supersession.md) — parent/child + supersedes/superseded-by.
  Same graph structure underneath campaign→task, charter amendments, decision overrides, persona-agent operated-by.
- [time-predicates.md](time-predicates.md) — consistent time vocabulary.
  `*-at-ord` (event-ordinal time, canonical), `*-at-wall-clock` (instrumentation only), cadence specs.
- [closure-rule-activation.md](closure-rule-activation.md) — how specs activate closure rules consistently.
  Premise pattern + conclusion + activation condition.
- [predication-category-grounding.md](predication-category-grounding.md) — explicit math-to-substrate mapping.
  Each substrate primitive cites the PredCat object/morphism it implements.
- [witness-lifecycle.md](witness-lifecycle.md) — the four-state monotone lifecycle (`open → proposed → resolved → archived`) shared by every substrate-emitted witness class. **Status: `draft`.**

## Pattern candidates (named, not yet authored)

These patterns have been identified but not yet authored; extraction lands in the consuming v0.x slice.

- **`heartbeat-fiber-subscription.md`** — fiber-subscription primitive shared by cross-shell coherence, heartbeat fan-out, and dashboard-refresh.
  Subscriptions are quantale-unit reads under the heartbeat clock.
  Consumed by v0.2b.
- **`cross-peer-clock-meet.md`** — meet-on-handshake primitive for federation regime/fuel/clock reconciliation.
  Consumed by v0.4 federation.
- **`cheapest-sufficient-tier-routing.md`** — bilattice-fold-with-regime-determination shared by voting, progress-rollup, and tier-routing.
  Consumed by v0.7 or v0.8.
- **`agent-as-substrate-resident-author.md`** — principal authoring substrate cells under deontic restriction, with witness lifecycle and supersession.
  Consumed by v0.8 or v1.0.
- **`umwelt-as-fiber-projection.md`** — perception-as-fiber-overlap-non-$\bot$-region primitive.
  Consumed by v0.7 productivity-stack.
- **`tower-fold-as-vocabulary-supersession.md`** — tower/fold primitive for model-supersession and learning.
  Consumed by v0.9 publishing-and-learning.
- **`entanglement-as-history-residue.md`** — entangled-pair-as-substrate-cell for world-history and agent self-development.
  Consumed by v1.0.
- **`world-tick-as-heartbeat-fold.md`** — `respond(world, heartbeat)` triggers settlement of every firable entity.
  Consumed by v0.5 ICS.

## How to read

- An agent picking up the OS reads kernel/ + filesystem/ first; then their target subsystem; then comes back here when they hit a pattern they don't understand.
- A spec author writing a new substrate-resident concept reads here first to know which patterns to invoke, then writes the spec citing back.

## Why patterns matter

1. **Consistency.** The substrate's algebra forces certain shapes (entity records, capability composition, monotone settlement).
  Subsystem specs that diverge are bugs, not variants.
2. **Implementability.** A new spec citing existing patterns is implementable from the patterns; a new spec re-deriving the patterns produces drift.
