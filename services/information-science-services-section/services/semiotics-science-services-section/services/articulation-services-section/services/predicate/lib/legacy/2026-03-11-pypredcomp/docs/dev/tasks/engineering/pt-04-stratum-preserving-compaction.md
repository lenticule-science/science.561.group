---
kind: task
title: "pt-04 — Compaction discipline that preserves stratum information"
description: "Pre-compaction tail of event_log.py retains one asserted, one saturated, and one settled summary cell per (s,p,o); replay from compacted-plus-tail produces byte-identical fibers."
slug: task:pt-04-stratum-preserving-compaction
of-goal: goal:v0.2a-kernel-frozen
of-milestone: milestone:v0.2a-multi-user-single-node
kind-of-task: engineering
status: blocked
blocked-from-status: dispatched
blocked-by: "Secondary theory's `compaction-via-cosettling-equivalence-class` theorem prescribes log-rewriting; draft spec specifies append-summary-event. Reconcile or extend theory."
owned-by-office: office:engineering
assigned-to-personnel: null
priority: 3
folds-into: t02-116
fixture-pair: t02-116f
---

# pt-04 — Compaction discipline that preserves stratum information

## Owning records

- Milestone: [milestones/v0.2a-multi-user-single-node.md](../../milestones/v0.2a-multi-user-single-node.md).
  Kernel slice.
- Goal: [goals/v0.2a-kernel-frozen.md](../../goals/v0.2a-kernel-frozen.md).
- Owning spec: [specs/kernel/compaction.md](../../specs/kernel/compaction.md) (`status: draft` — blocked) plus cross-link in [specs/filesystem/snapshots.md](../../specs/filesystem/snapshots.md).

## Grounding

[`events-are-stratified-substrate-is-a-presheaf`](../../decisions/events-are-stratified-substrate-is-a-presheaf.md) and [specs/kernel/stratified-facts.md](../../specs/kernel/stratified-facts.md).
Compaction is a left-Kan extension along the inclusion of the post-compaction event ordinal interval; the stratum must be preserved because the kernel's presheaf functor over $({\mathcal O}, \le)$ has the stratum index as an *independent* fibre.

## Description

OPEN-SPEC. v0.2a takes task family `t02-116` (stratum-preserving compaction): pre-compaction tail of `event_log.py` retains one `asserted` and one `saturated` and one `settled` summary cell per `(s,p,o)` rather than collapsing to a single representative; replay from compacted-plus-tail produces byte-identical fibers.

## Theory conflict

Secondary theory ([`predicated-computing/concepts/compaction.md`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/compaction.md)) and the proved theorem [`compaction-via-cosettling-equivalence-class`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/compaction-via-cosettling-equivalence-class.md) prescribe log-rewriting cosettling-equivalence-class compaction.
The draft `specs/kernel/compaction.md` specifies non-destructive append-summary-event compaction.
The two designs are not compatible.
Either rewrite the spec to log-rewriting, or extend secondary theory to authorize append-summary-event form.

## Acceptance

- Spec [specs/kernel/compaction.md](../../specs/kernel/compaction.md) is normative.
- `event_log.py` compaction preserves one summary cell per stratum per `(s,p,o)`.
- Replay from compacted-plus-tail produces byte-identical fibers vs. uncompacted replay.
- Paired fixture `t02-116f` covers the byte-identity gate.
