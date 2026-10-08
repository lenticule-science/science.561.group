---
source: [observations, rules, fuel]
target: [instincts, witness]
name: consolidate
description: "The morphism that runs one consolidation pass: given a set of Observations and a closure-rule system whose rules fire on the learning channel, settle the observations against one another to produce Instinct entities, emit consolidation events, and report what crystallized in the pass."
type: morphism
class: composed-operator
depends-on: [observation-record, instinct-record, settle, closure-rule-system, witness, consolidation-as-settlement]
see-also: [close-session, heartbeat-cycle, formality-progression, instinct-confidence-is-closure-fixpoint-measure]
title: consolidate
---


The morphism that runs one *consolidation pass*: given a set of [`Observation`](../objects/observation-record.md)s and a closure-rule system whose rules fire on the `learning` channel, [`settle`](settle.md) the observations against one another to produce [`Instinct`](../objects/instinct-record.md) entities, emit consolidation events, and report what crystallized in the pass.
`consolidate` is FARS's primary learning operator — the operator that turns accumulated experience into substrate-level patterns.

`consolidate` realizes the FARS-specific CL pipeline path *observation → instinct → skill → tool* (per [consolidation-as-settlement](../../settlement/consolidation-as-settlement/consolidation-as-settlement.md)) at the *observation → instinct* arrow.
Subsequent settlement-path arrows are separate substrate operations (the *instinct → skill* promotion is a closure rule firing on `learning` channel; the *skill → tool* demotion is a realization-side optimization).

## Signature

```
consolidate(observations; rules, fuel) → (instincts, witness)
```

Inputs:

- **`observations`** — set of [`ObservationRecord`](../objects/observation-record.md) references to consolidate over.
  Typically scoped: a session's observations, a multi-session window, all observations on a particular subject.
  Realizations MAY admit observations as a query (`channel: observation, subject: <X>, time-range: ...
  `) and resolve to the matching set.
- **`rules`** — reference to the [`ClosureRuleSystem`](../objects/closure-rule-system.md) version active for consolidation.
  Typically a *learning-channel-scoped* rule system whose rules' premises match observation patterns and whose conclusions produce instinct entities.
- **`fuel`** — bound on settle iteration depth.
  Consolidation rules may cascade (an instinct produced at one layer matches a downstream rule's premise that produces a higher-order instinct); fuel bounds the cascade.

Outputs:

- **`instincts`** — the set of [`InstinctRecord`](../objects/instinct-record.md) entities produced by the consolidation.
  May be empty if no rule's premise matched the observation set; may be many for rich observation sets under elaborate rule systems.
- **`witness`** — [`Witness`](../objects/witness.md) recording the consolidation: input observations (by hash), rule-system version, fuel consumed, fired rules, output instincts.

## Operational semantics

`consolidate` SHALL proceed:

1. **Resolve observations.** If `observations` is a query rather than an explicit set, run the query against the substrate's searchable tier (per [three-tier-memory](../../architecture/three-tier-memory/three-tier-memory.md)) to produce the explicit set.
  Verify each cited observation exists in the substrate; missing observations produce a `guard` diagnostic and the consolidation aborts.

2. **Compose observation fiber.** Per [`compose`](compose.md), build a fiber whose cells are the union of all the observations' predicates, with values composed pointwise via $\odot$.
  Concordant predicates (same predicate-name asserted with the same value across observations) sustain $t$-cells.
  Discordant predicates (the same predicate-name asserted with different values across observations) produce $\top$-cells — *contested predicates* that consolidation surfaces as candidates for diagnosis or repair, not for instinct-promotion.

3. **Run settle.** Invoke [`settle`](settle.md) on the composed observation fiber against the cited rule system, with the cited fuel.
  The rule system's `learning`-channel rules fire when observation patterns match their premises; their conclusions produce instinct-shape predications.

4. **Crystallize instincts.** For each new instinct-shape predication produced by settle, materialize an [`InstinctRecord`](../objects/instinct-record.md) per [`apply-edit`](apply-edit.md): the substrate edit creates the instinct entity with `trigger`, `outcome`, `confidence`, `observations` (citing the consolidated set by reference), and `status: proposed`.
  The substrate's edit discipline emits the create-instinct event on the `learning` channel.

5. **Confidence assignment.** For each new instinct, assess `confidence` per [consolidation-as-settlement](../../settlement/consolidation-as-settlement/consolidation-as-settlement.md): the closure-measure approach.
  The consolidation operator MAY check whether re-running the instinct's pattern against an extended observation set produces the same conclusion; idempotence under further training corresponds to high confidence.
  Realizations differ on the assessment shape (a value-domain element, a numeric scalar, a structured projection); the discipline is settledness-tracking, not raw count.

6. **Witness aggregation.** Construct the consolidation witness aggregating the per-fired-rule sub-witnesses, citing the input observations by hash, the rule-system version, the consumed fuel, and the output instincts.

7. **Emission.** Emit a `consolidation-completed` event on the `learning` channel with the aggregate witness as payload.
  The event surfaces the run for downstream dispatch — closure rules that fire on consolidation events MAY auto-promote validated instincts to skills, MAY notify a curator office for human review, MAY check the consolidation's contradicting predicates for substrate-coherence diagnostics.

## Normative invariants

- **Settle-based.** Consolidation SHALL be a [`settle`](settle.md) of observations against `learning`-channel closure rules.
  A realization that runs "consolidation" via a separate pipeline (not via settle) has lost the substrate-level discipline.
- **Substrate-resident inputs and outputs.** Both the input observations and output instincts SHALL be substrate entities.
  Consolidation that produces transient outputs (RAM-only summaries, log files outside the substrate) is non-conformant.
- **Determinism.** Same observations + same rule system + same fuel SHALL produce byte-identical instincts and witnesses.
- **Idempotence on settled input.** A consolidation pass over an observation set that has already been consolidated under the cited rule system SHALL produce no new instincts.
  The pass's witness records "no new patterns crystallized this run."
- **Witness-emitting.** Every consolidation pass SHALL emit a `consolidation-completed` event with the aggregate witness, even if no new instincts crystallized.
- **Confidence-tracked.** Every produced instinct SHALL carry a confidence assessment.
  Instincts without confidence are non-conformant; downstream operators (auto-promotion rules, dispatch) need the assessment to act.

## Failure modes

- **Observation references unresolvable.** Some cited observations don't exist in the substrate.
  Abort with `guard` diagnostic naming the missing observations.
- **Settle fuel exhaustion.** The consolidation's settle exceeds fuel before reaching fixed-point.
  Per [`settle`](settle.md)'s discipline: return partial output with the witness recording fuel exhaustion.
  The partial instincts MAY be admitted (with `status: proposed-partial` or equivalent) or discarded; realization choice.
- **Instinct creation failure** (per [`apply-edit`](apply-edit.md)).
  A new instinct's record fails validation-as-settlement.
  The consolidation's overall run continues for other instincts; the failed instinct is NOT created; a `guard` diagnostic surfaces the failure.
- **Empty observation set.** No observations match the query (or the explicit set is empty).
  The consolidation completes with empty output and an emission citing the empty input.

## Composition with the heartbeat

The [heartbeat-cycle](heartbeat-cycle.md) typically schedules consolidation via a closure rule whose premise matches "session-closed events older than threshold T whose observations have not been consolidated" — i.e., a periodic batch consolidation run.
The rule's conclusion invokes `consolidate` on the matching observation set; the rule fires across cycles until the substrate's consolidation is current.

A FARS realization MAY admit *eager* consolidation (per the `consolidate-now: true` flag of [`close-session`](close-session.md)) for sessions where instinct candidates are needed immediately.
Eager and batch consolidation are not mutually exclusive; they cover different operational rhythms.

## Position

`consolidate` is the morphism that *runs the substrate's learning loop*.
It is what turns the *observation* channel's accumulated content into the *learning* channel's settled patterns.
Without it, observations would accumulate but remain unstructured; instincts would never appear; the CL pipeline path would have no first arrow.

The morphism composes with [`Observation`](../objects/observation-record.md), [`Instinct`](../objects/instinct-record.md), [`ClosureRuleSystem`](../objects/closure-rule-system.md) (specifically the learning-channel-scoped rule system), [`settle`](settle.md), [`apply-edit`](apply-edit.md), [`emit-event`](emit-event.md).
It is invoked by [`close-session`](close-session.md) eagerly or by [`heartbeat-cycle`](heartbeat-cycle.md) as a scheduled batch.
