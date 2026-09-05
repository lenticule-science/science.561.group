---
type: concept
class: input-constraint
depends-on: [form, shape-record, closure-rule]
see-also: [validate-against-shape]
---

# Validation rule

A *substrate-recorded constraint on user-supplied input*: a validation rule is structurally a [closure rule](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md) whose premise matches form-input predications and whose consequent is either admission (the input passes) or a validation-error predication (the input fails with a specific error).

Common validation-rule patterns:

- **Required field.** Premise: field is empty. Consequent: validation-error("required").
- **Format check.** Premise: field doesn't match expected format (email, URL, phone). Consequent: validation-error("invalid format").
- **Range check.** Premise: numeric field outside allowed range. Consequent: validation-error("out of range").
- **Cross-field consistency.** Premise: two fields' values are inconsistent (start-date after end-date, password ≠ confirm-password). Consequent: validation-error.
- **Substrate-state consistency.** Premise: the input would create a duplicate (account-name already exists, email already registered). Consequent: validation-error.
- **External-reference check.** Premise: a field cites an entity that doesn't exist or isn't admissible (assigning to a deleted user). Consequent: validation-error.

Per [closure-rule-system](../../../objects/closure-rule-system.md), validation rules are part of the substrate's rule system. Per [settlement-determinism](../../../theorems/settlement-determinism.md), validation outcomes are deterministic on input — the same input under the same validation rules produces the same outcomes.

Per [witness](../../../objects/witness.md), each validation outcome (pass or fail) produces a witness recording the input, the rule, and the result. An auditor can review form-validation history.
