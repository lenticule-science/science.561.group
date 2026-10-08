---
name: advance-tick
description: "The morphism that performs one tick — one closure-rule application step at one entity."
title: advance-tick
---

The morphism that performs one *tick* — one closure-rule application step at one entity.
`advance-tick` is the smallest unit of [tick-as-iteration](../../tick-as-iteration/tick-as-iteration.md): it reads one entity's fiber, matches the active rules' premises against it, fires matching rules, composes their conclusions into the fiber, emits per-rule events, and reports the resulting fiber's settled-or-unsettled state.
The [`heartbeat-cycle`](heartbeat-cycle.md) calls `advance-tick` once per registered entity per cycle.

## Signature

```
advance-tick(entity; rules, fuel) → (fiber, advanced, witness)
```

Inputs:

- **`entity`** — the entity address to tick.
  The morphism reads the entity's [`Note`](../objects/note.md) via [`load`](load.md), interprets it via [`interpret`](interpret.md), and operates on the resulting fiber.
- **`rules`** — the [`ClosureRuleSystem`](../objects/closure-rule-system.md) version active at this scope.
- **`fuel`** — bound on the number of rule applications within this tick.
  A single tick is *one closure-rule application step*; per the layered settle discipline of [`settle`](settle.md), this is one BFS layer of rule firings (multiple rules may fire concurrently within the layer if their premises match independently).
  Realizations SHOULD default fuel to 1 (one layer per tick) for fine-grained scheduling, or to the rule system's full fuel for coarse-grained scheduling.

Outputs:

- **`fiber`** — the entity's fiber after the tick, with any newly-fired rule conclusions composed in.
- **`advanced`** — boolean: true iff at least one rule fired during the tick.
  False indicates the entity is at fixed-point under the current rule system; the [`heartbeat-cycle`](heartbeat-cycle.md) deregisters such entities from the next cycle's selection set.
- **`witness`** — [`Witness`](../objects/witness.md) recording the input fiber hash, the rule-system version, the fired rules' identities and match sites, the consumed fuel, the output fiber hash.
  One witness per tick; the witness aggregates the per-rule sub-witnesses.

## Operational semantics

`advance-tick` SHALL proceed:

1. **Load and interpret.** Resolve the entity address; [`load`](load.md) the corresponding `Note`; [`interpret`](interpret.md) it into the entity's current fiber.
  (Realizations MAY pass the fiber directly when caching; the discipline is the same.)
2. **Match.** Per [closure-rule-record](../objects/closure-rule-record.md), walk the rule system's rules; for each rule, scan the fiber for cells matching the rule's premise.
  Per [closure-rule-application](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md), match-radius bounds the read.
3. **Apply.** For each rule whose premise matched, compute its conclusion fiber.
  Compose the conclusions into the entity's fiber via [`compose`](compose.md) — pointwise $\odot$ on existing values.
  Concordant additions ($t$-cells where the entity already had $t$) sustain.
  Discordant additions produce $\top$-cells per [validation-as-settlement](../../settlement/validation-as-settlement/validation-as-settlement.md).
4. **Emit events.** For each fired rule, [`emit-event`](emit-event.md) one event on the rule's declared channel (or `mutation` channel by default), with `subject: entity`, `actor: heartbeat-record`, `origin: rule-record-hash`, payload citing the rule's conclusion.
  Each emission produces a per-rule sub-witness; the tick's aggregate witness chains them.
5. **Compute advanced.** `advanced` is true iff at least one rule fired.
  If no rule fired, the entity's fiber matches no premise's pattern under the rule system; the entity is at fixed-point and the cycle's caller may deregister it.
6. **Witness.** Construct the `Witness` aggregating step 4's sub-witnesses with the input fiber hash and the output fiber hash; return.

## Normative invariants

- **Deterministic.** Same `(entity, rules, fuel)` SHALL produce byte-identical `(fiber, advanced, witness)`.
  The order of rule applications within a tick SHALL be canonical (lexicographic by rule hash) per [determinism](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md).
- **Locality-respecting.** `advance-tick` reads only the entity's fiber, the rule system's rules, and (for cross-fiber rules) the bounded neighborhood declared by each rule's match-radius.
  It SHALL NOT read the global graph.
- **Witness-emitting.** Every `advance-tick` SHALL produce a witness, even when `advanced` is false (the witness records the no-fire state for replay equivalence).
- **Idempotent at fixed-point.** When the entity's fiber is already at fixed-point under the rule system, `advance-tick` SHALL find no matches and return `advanced: false`.
  The fiber is unchanged; fuel is unconsumed; the witness records the no-advance state.
- **Bounded fuel.** A single tick's fuel SHALL be bounded.
  A tick's caller (the heartbeat cycle) sees the bound; if the cycle's per-entity fuel is exhausted before fixed-point, `advanced` is true and the entity remains registered for the next cycle.

## Failure modes

- **Rule conflict producing unrecoverable $\top$.** Two rules fire whose conclusions disagree on a cell, and the rule system's repair catalog has no admissible recipe.
  The $\top$-cell remains in the output fiber; the witness records the conflict; the entity stays registered for downstream-rule attempts.
  This is an *anomaly per [anomaly-as-contradiction](../../settlement/anomaly-as-contradiction/anomaly-as-contradiction.md)* — substrate-visible, not exception-throwing.
- **Rule system version unavailable.** `rules` cites a version not in the substrate's rule-system registry.
  Per [`settle`](settle.md)'s failure mode discipline, `advance-tick` SHALL either run against the cited version (if reproducible from the event log) or abort with a `guard`-channel diagnostic.
- **Entity not loadable.** The cited entity address resolves to no `Note` in the substrate.
  Abort with a `guard`-channel diagnostic naming the missing entity; the heartbeat's caller deregisters or reports.

## Position

`advance-tick` is the substrate's temporal-advance primitive at entity granularity.
Where [`settle`](settle.md) advances a fiber to fixed-point in (potentially) multiple layers, `advance-tick` advances one fiber by one layer; the difference matters when the heartbeat needs to interleave work across many entities rather than running each to completion.

The morphism realizes AgOP's [tick concept](../../teaching/explanations/tick.md) and AgOP's [tick-advance morphism](../../../tick/tick-advance/tick-advance.md) at FARS's value-domain.
Per the AgOP discipline, a tick is "one closure-rule application step on one entity"; FARS commits to that exact reading.
Multi-tick coordination is [`heartbeat-cycle`](heartbeat-cycle.md)'s job.
