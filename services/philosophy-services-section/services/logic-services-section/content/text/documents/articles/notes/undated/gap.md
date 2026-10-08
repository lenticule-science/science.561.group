---
name: gaps
description: A named absence in a roadmap — an object or morphism referenced by some other record but for which no record exists, or a field type referenced by an object whose type-record is missing, or a record declared in shape that no task adds. Gaps surface as cells produced by the finding-gaps-in-a-roadmap skill.
title: gaps
---

A gap is the records' way of making absence addressable. Where a record is required (because another record names it as a precondition or as a field type) but the record does not exist, the gap names exactly what is missing and exactly what would consume it.

Five gap kinds the finding-gaps-in-a-roadmap skill surfaces:

- **Missing-by-task-requires (object).** Some task lists an object slug in its `requires.objects` but no other task lists that slug in its `adds.objects`. The implied missing task is the one that would introduce the object.
- **Missing-by-task-requires (morphism).** Same pattern for morphisms.
- **Missing-type-by-object-field.** Some object's `fields` list names a type slug, but no object record exists at that slug. The implied missing record is the typed object the field expects.
- **Missing-type-by-morphism-signature.** Some morphism's `inputs[i].type` or `output.type` names a slug with no record. Same shape.
- **Authoring-gap-by-empty-fields.** An object record exists but its `fields` list is empty. This is not a structural gap but an authoring gap — the next pass to fill.

The gap-form is a categorically-distinct predication-shape because gaps must be addressable for dispatch: a captain reviewing a roadmap dispatches work to fill the gaps, and the dispatch must name each gap unambiguously. A gap that cannot be cited cannot be assigned.
