---
type: concept
class: structured-input
depends-on: [shape-record, validate-against-shape, predication-cell]
see-also: [validation-rule, notification]
---

# Form

A *substrate-recorded structured-input shape* — a form is the user-experience representation of a [shape-record](../../../objects/shape-record.md) used as an input contract. Where shape-records constrain substrate content in general, forms specialize for *user-supplied input* with field-level UI, validation, and submission semantics.

A form has the structure:

- **Form-shape reference** — the [shape-record](../../../objects/shape-record.md) defining the form's fields, types, and constraints.
- **Field UI metadata** — how each field is rendered (text input, dropdown, checkbox, file upload), labels, help text, ordering.
- **Validation rules** — references to [validation-rule](validation-rule.md) records that check user input before substrate admission.
- **Submission target** — the substrate operation that runs when the form is submitted (admit a new entity, update an existing one, dispatch a runbook).
- **State** — the form's lifecycle state: `draft`, `submitted`, `validated`, `processed`, `failed`.

Per [validate-against-shape](../../../morphisms/validate-against-shape.md), form submission is structurally:

1. The user fills the form's fields (substrate state: per-field draft predications).
2. The user submits.
3. The substrate validates the submitted content against the form-shape and validation-rules.
4. If validation passes, the substrate admits the form's submission per the cited submission-target.
5. If validation fails, validation-error predications are surfaced to the user; the form returns to draft state.

Per the substrate's [observability-as-reads](../../../theorems/observability-as-reads.md), the form's draft state is queryable as substrate content. Forms can be saved-as-draft and resumed later; per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), a form's state at any draft point can be reconstructed.

Common form patterns:

- **Single-step form.** All fields on one page; submit validates and processes.
- **Multi-step wizard.** Fields split across pages; per-step validation, per-step substrate state.
- **Conditional fields.** Some fields appear/disappear based on prior answers; the form-shape includes conditional predications.
- **File upload fields.** Per the substrate's [content-addressed-store](../../../objects/content-addressed-store.md), uploaded files are admitted as content-addressed entries; the form's field references the file by content-hash.
