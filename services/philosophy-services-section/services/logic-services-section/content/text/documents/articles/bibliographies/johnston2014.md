---
type: reference
authors: [Johnston, Tom]
year: 2014
title: "Bitemporal Data: Theory and Practice"
venue: "Morgan Kaufmann / Elsevier"
description: T.
---

## Full citation

T. Johnston. *Bitemporal Data: Theory and Practice*. Morgan Kaufmann / Elsevier, 2014.

## Status

Not directly accessed; cited at training-knowledge level.

## Annotation

Develops the bitemporal relational database model — tracking both **valid time** (when a fact holds in reality) and **transaction time** (when the record was written into the database) — and extends it to a **tritemporal** model by adding **assertion time**: the period $[t_\mathrm{asserted}, t_\mathrm{retracted})$ during which a speaker holds their illocutionary act in force.

Assertion time is explicitly grounded in Austin's ([@austin1962]) speech-act theory: the assertion is the illocutionary act; its time period is the period during which the speaker is committed to that act. Retraction closes the interval.

In the tritemporal model, a database row is `〈object_id, property_value, [valid_from, valid_to), [asserted_from, asserted_to), [recorded_from, recorded_to)〉`. The content (proposition) and the act (assertion) and the recording are each independently tracked.

Cited in the [temporally-bounded positing theorem](../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-1/theorems/temporally-bounded-positing.md): PredCat's settling bound $\lambda$ supports Johnston's assertion-time dimension — the truth-window $[\tau_0, \tau_1) \subseteq \lambda$ during which a cell is truth-designated is the PredCat realization of Johnston's assertion time. Retraction is modeled as a denial positing morphism (escalating the cell to $\top$), and limit-ordinal retractions are non-Scott-continuous firing ordinals.

Note: Johnston uses "assertion" throughout for what this question calls "positing"; the two are terminologically aligned via Johnston's grounding in Austin.
