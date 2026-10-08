---
type: morphism
class: scheduler-operator
realizes: [tick, heartbeat]
depends-on: [heartbeat-scheduler, tick, closure-rule-application, predication-settling, settling-endofunctor]
see-also: [skill-invocation, dispatch-matching]
title: Tick advance
description: The operator that emits one tick at one entity, advancing that entity's predications by one closure-rule application.
---

# Tick advance

The operator that emits one [tick](teaching/explanations/tick.md) at one entity, advancing that entity's predications by one [closure-rule application](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md).
Tick-advance is structurally the substrate-side instance of one application of the math [settling-endofunctor](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/settling-endofunctor.md) at a single entity — the smallest unit of platform-level temporal advance in the substrate's [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md).
Tick advance is invoked by the [heartbeat scheduler](../../heartbeat/heartbeat-scheduler/heartbeat-scheduler.md) once per cycle per selected entity.

## Signature

`tick-advance(entity, rule-system) → (post-tick-state, witness)`

Inputs:

- **`entity`** — reference to the entity to be ticked.
- **`rule-system`** — reference to the active [closure-rule records](../../../objects/closure-rule-record.md) and [repair catalog](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/repair-catalog.md).

Outputs:

- **`post-tick-state`** — the entity with one closure-rule application applied (or, if no rule's premise matched, the entity unchanged).
- **`witness`** — records the entity's pre-tick canonical hash, the rule applied (if any), the resulting predications inserted, the entity's post-tick canonical hash, and the registration consequence.

## Operational semantics

Tick advance proceeds in five steps:

1. *Read entity.* Read the entity's current predications and the predications of immediately-related entities at any cited closure rule's match radius.
2. *Match.* Find the closure rule (if any) whose premise matches the entity's current state, choosing among multiple matches by the substrate's lexicographic-canonical-hash discipline (per [determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md)).
3. *Apply.* If a rule matched, apply it (insert the conclusion predication, with appropriate value-domain join against any existing value).
  If no rule matched, the entity is at-fixed-point relative to this rule system; the tick is a no-op-witness.
4. *Re-evaluate registration.* Determine whether the entity should remain registered for the next heartbeat cycle: if any rule's premise still matches against unrecorded conclusions, yes; if the entity has reached fixed-point per [settling-quiescence](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-quiescence/settling-quiescence.md), no.
5. *Witness emit.* Append a tick witness to the [event log](../../../objects/event-log.md).

## Engineering invariants

- **Per-entity bounded.** A tick advance reads at most a finite radius from the entity (per [wavefront-termination](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-termination.md)'s locality); its memory is bounded by the entity's predication count plus the rule's match radius, not by the global graph.
- **Single-application.** A tick advance applies *one* closure rule application, not multiple.
  Multiple matches at one entity are handled across multiple ticks.
- **Witness-emitted unconditionally.** Even a no-op tick (no rule matched) produces a witness recording "no advance"; the witness's purpose is to record that the entity was visited.
- **Registration is computed, not declared.** Entity registration for the next cycle is a function of the post-tick state.

## Failure modes

- **Rule body errors.** When the matched rule's body fails to apply (a precondition for an inserted predication is unsatisfied, a cited shape rejects the conclusion), the substrate's [repair](../../teaching/explanations/repair.md) discipline determines the outcome.
- **Entity not found.** If the cited entity does not exist (was retired between heartbeat selection and tick advance), the witness records the absence and the heartbeat removes the entity from registration.

## Position in the platform

Tick advance is the platform's smallest temporal unit.
The [heartbeat scheduler](../../heartbeat/heartbeat-scheduler/heartbeat-scheduler.md) calls tick-advance per selected entity per cycle; the cumulative effect of many tick-advances across many entities is the platform's [settlement](teaching/explanations/settlement.md) — the closure-driven advance toward fixed-point per [closure-driven-settling-monotonicity](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-monotonicity/references/closure-driven-settling-monotonicity.md).
Without tick-advance, the platform has no operational advance; with it, the platform advances one entity, one rule, one witness at a time.
