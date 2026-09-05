---
type: morphism
class: substrate-operator
realizes: [shape, vocabulary-completeness]
depends-on: [shape-record, traversal]
see-also: [insertion, guard]
---

# Validate against shape

The operator that checks whether a substrate entity satisfies a [shape](theories/agential-orchestration-platform/concepts/shape.md)'s declared constraints. Validate-against-shape is the substrate's primitive for shape conformance: every operation that needs to admit, reject, or classify an entity by shape invokes this operator.

## Signature

`validate-against-shape(entity, shape) → (validation-result, witness)`

Inputs:

- **`entity`** — reference to the substrate entity being validated.
- **`shape`** — reference to the [shape-record](theories/agential-orchestration-platform/objects/shape-record.md) declaring the constraints.

Outputs:

- **`validation-result`** — a substrate predication recording the verdict. Valid: every constraint satisfied. Invalid: at least one constraint violated, with each violation enumerated (which constraint, what was missing, what was forbidden, severity).
- **`witness`** — records the validate: entity-id, shape-id (with version), the constraints checked, the violations found, the resulting validation-result hash.

## Operational semantics

Validate-against-shape proceeds in five steps:

1. *Resolve shape applicability.* Check whether the entity carries any of the shape's `targets` predicates. Per [identity by relations](teaching/explanations/identity-by-relations.md) and the Fregean targetSubjectsOf pattern, the shape applies iff the entity carries a targeted predicate. If no targeted predicate is carried, validation is vacuously satisfied (the shape does not apply).
2. *Check required predicates.* For each predicate in the shape's `required` field, verify the entity carries it. Missing required predicates produce violation predications.
3. *Check forbidden predicates.* For each predicate in the shape's `forbidden` field, verify the entity does not carry it. Present forbidden predicates produce violation predications.
4. *Check value-constraints.* For each predicate the entity carries that the shape constrains values for, verify the carried value satisfies the constraint (range, enumeration, sub-shape reference, regex, derived constraint). Mismatches produce violation predications.
5. *Check cardinality.* For each predicate the entity carries, verify the count satisfies the shape's cardinality bounds (at-most, at-least, exactly). Out-of-range counts produce violation predications.

The final result is built by aggregating: vacuous, valid, or invalid (with the list of violations and their severities).

## Engineering invariants

- **Read-only.** Validate-against-shape does not modify the entity or the shape. Its only output is the validation-result.
- **Deterministic.** Given the same entity (same canonical hash) and the same shape (same canonical hash), validation produces the same result.
- **Cited at version.** The validation witness cites the shape's canonical hash at the time of validation; later edits to the shape do not retroactively invalidate past validations.
- **Targeted-predicate aware.** Validation is opt-in based on the entity's predicates: an entity that doesn't carry a targeted predicate is not subject to the shape's constraints. This is the substrate's [identity-by-relations](teaching/explanations/identity-by-relations.md) discipline applied to validation.

## Failure modes

- **Shape missing.** The cited shape-record does not exist. The validate aborts; the substrate's vocabulary-completeness discipline flags the missing shape as a substrate gap.
- **Constraint unevaluable.** A value-constraint references a sub-shape that doesn't exist, or a derived constraint that fails to compute. The validation produces a constraint-error rather than a verdict; per the substrate's repair discipline, the situation is escalated.

## Position in the substrate

Validate-against-shape is the substrate's *constraint-checking primitive*. Higher-level operators invoke it: [guards](theories/agential-orchestration-platform/concepts/guard.md) use it before admitting an action; [skill-invocation](theories/agential-orchestration-platform/morphisms/skill-invocation.md) uses it at preconditions and postconditions; [insertion](insertion.md) of new entities may use it to enforce shape conformance at write time.

The discipline of validate-against-shape is the substrate-level enforcement of [closure conditions](teaching/explanations/closure-conditions.md) condition 5 (subobject classification): shapes classify which sub-configurations are admissible, and validate-against-shape is the substrate operation that performs the classification.
