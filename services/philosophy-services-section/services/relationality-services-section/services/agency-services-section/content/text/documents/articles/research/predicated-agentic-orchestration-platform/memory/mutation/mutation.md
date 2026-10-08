---
type: concept
class: operation-kind
depends-on: [operation-kinds, witness]
see-also: [query, guard, settle]
title: Mutation
description: "The platform's change-substrate-state operation kind: an operation that takes substrate input, computes a transformation, and writes new predications (or updates existing ones) to the predication-graph store."
---

# Mutation

The platform's *change-substrate-state* operation kind: an operation that takes substrate input, computes a transformation, and writes new predications (or updates existing ones) to the [predication-graph store](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md).
Every change to substrate content originates with a mutation.

A mutation is structurally distinct from a [query](../../query/query.md): a mutation always produces state change.
It is also distinct from a [guard](../../governance/guard/guard.md): a mutation does not produce a verdict; it produces an effect.

## Three engineering commitments

Every mutation operation must satisfy:

- **Pre-mutation guard.** Before changing substrate state, the mutation runs an admissibility check (per [guard](../../governance/guard/guard.md)).
  The check confirms the actor's authorization, the proposed predications' shape conformance, and any soul-violation considerations.
  Mutations without prior guards are violations.
- **Witness-emitted.** The mutation produces a [witness](../../teaching/explanations/witness.md) entry recording the substrate state's pre-hash, the operation invoked, the produced predications, the substrate state's post-hash, the [origin](../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/origin.md).
  Every mutation is in the [event log](../../../objects/event-log.md).
- **Atomic.** A mutation either succeeds (all proposed predications are written, post-state-hash is computed and witnessed) or fails (no predications are written, the failure is witnessed).
  Partial mutations are not admissible.

## Structural decomposition

Within the mutation's body, the substrate operations performed are a sequence of:

- **[Insertions](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/insertion.md)** — new predications.
- **[Retractions](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/retraction.md)** — predication removals (admissible only as part of declared [repairs](../../teaching/explanations/repair.md) or scope-bounded view changes).
- **Value upgrades** (a special case of insertion) — raising an existing predication's value in the substrate's value-domain.
- **Sub-operation invocations** — calls into other substrate operators (closure-rule applications, skill invocations, plus-construction, sync) which themselves perform insertions, retractions, etc.

The substrate's discipline is that the body's primitive operations are bounded, sequential, and individually witnessed; the mutation's overall witness aggregates them into one composite record.

## Position in the platform

Mutations are the substrate's *event-source*: every entry in the event log is the witness of some mutation.
The substrate's audit, replay, and federation guarantees rest on every state change being a mutation; operations that change state without producing mutation witnesses are bugs to be diagnosed.

Particular mutation patterns:

- **Insert-predication.** A direct insertion of a new predication, gated by a guard.
- **Apply-closure-rule.** A [closure-rule application](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md) firing on matched substrate state.
- **Skill-invocation.** A [skill record](../objects/skill-record.md)'s body executed; the skill's body is itself a sequence of mutations.
- **Coherence-repair.** A [coherence-glue](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/coherence-glue.md) operation resolving a value conflict.
- **Sync-apply.** Applying a peer's events during [sync](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/sync.md).

Each is a mutation; each produces a witness; each is replayable.
