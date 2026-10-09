---
type: morphism
class: form-operation
realizes: [form, validation-rule]
depends-on: [form-record, validate-against-shape, witness]
see-also: [form, validation-rule]
---

# Submit form

The substrate operation that processes a [form](teaching/explanations/form.md) submission: validates the user input against the form's [shape-record](../../../objects/shape-record.md) and validation rules, and (on success) admits the substrate operation declared by the form's submission-target.

## Signature

`submit-form(form-record-id, submitted-values, submitter) → (admitted-content | validation-errors, witness)`

Inputs:

- **`form-record-id`** — reference to the form being submitted.
- **`submitted-values`** — the user-supplied field values.
- **`submitter`** — the user/agent submitting.

Outputs:

- **`admitted-content`** — on validation success, the substrate content the form's submission-target produced (a new entity, an update, a runbook invocation).
- **`validation-errors`** — on validation failure, per-field error predications.
- **`witness`** — records the submission, validation outcomes, and admitted content (if any).

## Operational semantics

1. *Shape-validate.* Per [validate-against-shape](../../../morphisms/validate-against-shape.md), check the submitted values conform to the form's shape.
2. *Rule-validate.* For each cited [validation-rule](teaching/explanations/validation-rule.md), apply its premise; collect any consequent validation-error predications.
3. *Decision.* If any validation rule produced an error, refuse with the validation-errors witness. If all passed, proceed.
4. *Apply submission-target.* Run the form's submission-target operation with the validated input. The target may be an admit (new entity creation), an update (modifying existing entities), or a runbook invocation.
5. *Witness emit.* Records both validation outcomes and submission outcome.

## Engineering invariants

- **Validation-before-admission.** Submission-target only runs after all validation passes. No partial admissions on validation failure.
- **Per-field error reporting.** Validation errors are attached to specific fields, not just the form as a whole.
- **Replay-deterministic.** Per [settlement-determinism](../../../theorems/settlement-determinism.md), submission outcomes are deterministic on input + validation rules.
- **Authorization-respecting.** Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), the submitter must be authorized to perform the form's submission-target.
