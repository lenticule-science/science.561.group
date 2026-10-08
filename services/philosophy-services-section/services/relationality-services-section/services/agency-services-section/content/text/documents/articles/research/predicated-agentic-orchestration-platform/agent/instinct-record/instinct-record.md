---
type: definition
class: substrate-entity
realizes: [settlement-path]
depends-on: [observation-record, settlement-path]
see-also: [skill-record, dispatch]
title: Instinct record
description: "An instinct record is the second stage of the settlement path: a substrate-entity derived from a pattern across observation records, declaring a trigger pattern, a diagnosed cause, and a suggested response."
---

# Instinct record

An **instinct record** is the second stage of the [settlement path](teaching/explanations/settlement-path.md): a substrate-entity derived from a pattern across [observation records](observation-record.md), declaring a *trigger pattern*, a *diagnosed cause*, and a *suggested response*.
An instinct is what the platform's reflection on its own observations produces — the structured claim "when this kind of thing happens, here's what's going on, and here's what to do about it."

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of the pattern.
- **`closure-kind`** — `derivation` (the instinct *derives* from observations).
- **`pattern`** — predications describing the recurring observation pattern: which kinds of subjects, which kinds of what-happened content, which co-occurring conditions.
  Typically a [shape](../../scope/shape/shape-record/shape-record.md) reference.
- **`trigger`** — predications declaring when the instinct is consulted: which substrate state matches against the pattern to trigger the instinct's claim.
- **`diagnosed-cause`** — predications declaring the *why* the instinct claims: what about the pattern's trigger conditions explains the observations.
- **`suggested-response`** — predications declaring what should be done in response: typically a reference to a [skill record](skill-record.md), a [runbook record](runbook-record.md), or a sequence of substrate operations.
- **`derived-from`** — references to the observation records that produced this instinct.
  Required for [provenance](../../teaching/explanations/provenance.md): the instinct's claim is traceable to its supporting observations.
- **`confidence`** — the substrate's measure of how settled the instinct is.
  Per the [settlement-path](teaching/explanations/settlement-path.md) discipline, confidence is *closure-proximity*: how stable the instinct is under additional observations and additional applications.
  Not a count.
- **`scope`** — references to the scopes within which the instinct is applicable.

## Invariants

- **Pattern matches at least one observation.** An instinct must be derived from at least one observation record; an instinct with empty `derived-from` is a substrate violation.
- **Scope-coherent.** The instinct's scope is consistent with the scopes of its derived-from observations.
- **Suggested response references real entities.** Skill or runbook references in `suggested-response` resolve to substrate entities.

## Operations

- *Derive.* A [closure rule](../../teaching/explanations/closure-rule.md) consulting a window of observation records can produce an instinct record by matching a pattern across them and synthesizing the trigger, cause, and suggested-response.
  The derivation is itself a substrate operation, with witness.
- *Consult.* During [dispatch](teaching/explanations/dispatch.md) or substrate-state evaluation, instincts whose triggers match the current state are consulted; their suggested responses become candidates the dispatch operator may select.
- *Refine.* When subsequent observations reinforce or contradict an instinct, the substrate's closure rules update the confidence and (in some cases) refine the pattern, trigger, or suggested-response.
  Each update is a new version; the [event log](../../../objects/event-log.md) records the revision history.

## Position in the platform

Instinct records are the platform's *first-derivation layer*: where raw observations become reusable engineering claims.
Per [agential self-generation](../agential-self-generation/agential-self-generation.md), instincts are themselves substrate entities, queryable and modifiable through the same operators as content.
The platform's *learning* operationally is the production of instincts and their progression along the settlement path toward skills and tools.

Instincts sit at intermediate [formality](../../scope/formality-layer/formality-layer.md): they are produced by reflection on observations (typically still inference-bearing, with non-trivial cost), but their consultation is structured (matching predications against triggers is closer to query than to inference).
The platform that has accumulated relevant instincts can answer many questions cheaply by instinct-consultation rather than by repeated reflection.
