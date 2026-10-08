---
id: flatfile-agential-resource-system-message
description: "A FlatfileAgentialResourceSystemMessage is a Step submitted to a locale's intake boundary: a local section from the sending locale's fiber, offered to the receiving locale's nucleus for evaluation and incorporation."
describes: Step, Transfer, RelationalMachineInterface
uses: RelationalMachine, RelationalHistoryFiberDoctrineLanguage
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  sending-locale: relational-universe
  section-form: fiber-local-section
  history: relational-history
output: relational-history
ast:
  intake-step:
    - sending-locale
    - section-form:
        - fix-needed
        - gap-found
        - discovery
    - history
title: Flatfile Agential Resource System Message
---

# Flatfile Agential Resource System Message

## What this is

A **FlatfileAgentialResourceSystemMessage** is a [Step](../math/relational-history.md) submitted to a locale's intake boundary.

In a [RelationalMachine](relational-machine.md), the intake boundary receives Steps, each of which extends the history monoid M(Σ, I) and triggers nucleus evaluation on the new fiber.

A FlatfileAgentialResourceSystemMessage is one such Step.
It carries a **local section** — content from the sending locale's fiber H_t — and presents it to the receiving locale's nucleus (σ ∘ Δ) for evaluation.
The Engine processes the section and determines whether it settles in the receiving fiber (acknowledged), is not yet in the nucleus's domain (deferred), or cannot be incorporated (declined).

A FlatfileAgentialResourceSystemMessage is NOT a OperationItem.
It becomes a OperationItem only after the receiving locale's nucleus evaluation has run and the section has settled as actionable.

## Message as Step in M(Σ, I)

In the relational machine's history monoid M(Σ, I):

- Each Step s ∈ Σ extends the current history t to t' = t ⋅ s.
- Commuting steps (s I s') produce the same history class regardless of order.
- The new fiber H_{t'} is obtained by extending H_t.

A FlatfileAgentialResourceSystemMessage submitted to locale B from locale A is a Step from A's history being introduced into B's history.
The section it carries is the data of that step — the specific content from A's fiber being offered to B.

Submitting a FlatfileAgentialResourceSystemMessage to a locale's intake boundary is a history-extending act.
When the locale's Engine runs, it processes that step and the fiber grows (or the step is deferred/declined, leaving the history unchanged at that depth).

## Section forms

Every FlatfileAgentialResourceSystemMessage carries a section of one of three named forms, each corresponding to a distinct relation between the offered element and the receiving fiber:

| Section | Relation to receiving fiber | Nucleus action |
|------|-------------|----------------|
| `FixNeeded` | Element present but below the nucleus's fixed point — a correction | σ raises the existing element; the corrected form replaces it |
| `GapFound` | Element absent from the fiber — an addition | The element is added; the fiber extends |
| `Discovery` | Element stable in sender's fiber, offered for transfer | Δ_t (Transfer nucleus) evaluates whether the section transfers stably |

FixNeeded, GapFound, and Discovery are named entities.
They are not labels — each names a distinct structural relation between an offered section and the receiving fiber.
They map to the three ways a Step can change a fiber: correction, addition, transfer.

## Required fields

Every FlatfileAgentialResourceSystemMessage MUST have:

- **from**: the sending locale
- **date**: when the step was submitted
- **section**: the id of the section form — one of `FixNeeded`, `GapFound`, or `Discovery`
- **subject**: one sentence naming the section being offered
- **urgency**: exactly one of `Blocking`, `Normal`, or `Low`
- **status**: exactly one of `unread`, `acknowledged`, `deferred`, `declined`
- **body**: the section content — enough that the receiving locale's Engine can evaluate it without reading the sender's files

## Status lifecycle — nucleus evaluation

The status field records where the section is in the nucleus evaluation pipeline:

```
unread      → the step has arrived at the [RelationalMachineInterface](relational-machine-interface.md) but the Engine has not yet run
acknowledged → σ(section) > section — the nucleus can work with it; produces a OperationItem in PLANS.md
deferred    → section not yet in the nucleus's domain; moved to IDEAS.md for later
declined    → section fails to settle in this fiber; the Engine records the reason
```

The Engine MUST run on every `unread` FlatfileAgentialResourceSystemMessage during the locale's Orientation phase (before PLANS.md is read).
No FlatfileAgentialResourceSystemMessage MAY remain `unread` after Orientation completes.

When `acknowledged`: the Engine MUST add a OperationItem to `PLANS.md`.
The OperationItem's **Why:** MUST reference the FlatfileAgentialResourceSystemMessage id.

When `deferred`: the Engine MUST add an FlatfileAgentialResourceSystemIdea to `IDEAS.md`.

When `declined`: the Engine MUST append a one-sentence reason to the FlatfileAgentialResourceSystemMessage body (e.g., "Declined: this section belongs in proof/, not spec/").

## Intake constraint

No agent MAY submit a FlatfileAgentialResourceSystemMessage to another locale's intake boundary without using the locale's designated submission method.
This ensures FlatfileAgentialResourceSystemMessages have the required fields and the sending locale records the step submission.

## Relationship to other types

- An `acknowledged` FlatfileAgentialResourceSystemMessage produces: a [OperationItem](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/operation-item.md)
- A `deferred` FlatfileAgentialResourceSystemMessage produces: a [FlatfileAgentialResourceSystemIdea](../flatfile-agential-resource-system-idea/flatfile-agential-resource-system-idea.md)
- A `declined` FlatfileAgentialResourceSystemMessage produces: nothing — archived in place with reason

## Open questions
