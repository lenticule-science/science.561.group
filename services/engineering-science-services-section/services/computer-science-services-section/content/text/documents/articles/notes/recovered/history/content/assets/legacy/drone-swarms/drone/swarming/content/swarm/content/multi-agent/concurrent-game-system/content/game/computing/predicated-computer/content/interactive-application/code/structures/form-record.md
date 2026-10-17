---
type: definition
class: substrate-entity
realizes: [form]
depends-on: [form, shape-record, validation-rule]
see-also: [validate-against-shape]
---

# Form record

A **form record** is the substrate-entity formal definition of a [form](teaching/explanations/form.md): a structured-input shape with field-level UI metadata, validation rules, and submission semantics.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`form-shape`** — reference to the [shape-record](../../../objects/shape-record.md) defining the form's fields and types.
- **`field-ui-metadata`** — per-field UI specification: input kind (text, dropdown, checkbox, file), label, help text, ordering, conditional visibility.
- **`validation-rules`** — references to the [validation-rule](teaching/explanations/validation-rule.md) records to apply.
- **`submission-target`** — reference to the substrate operation that runs on submit: an admit operation, an update operation, a runbook invocation.
- **`state`** — `published` (accepting submissions), `draft` (in development), `retired` (no longer accepting).
- **`closure-kind`** — `form`.

## Invariants

- **Shape-validation-coherent.** The validation-rules cite fields that exist in the form-shape.
- **Submission-target-resolvable.** The cited submission-target is a valid substrate operation.
- **Field-UI-coherent.** Every field in the form-shape has corresponding UI metadata (or default UI is admissible).

## Position in the platform

Form records are the substrate's *structured-input registry*. Used for everything from login forms to task-creation forms to multi-step wizards.
