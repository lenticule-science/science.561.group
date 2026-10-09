---
type: morphism
class: type-checking-operation
realizes: [type, refined-type]
depends-on: [type-record, function-record, code-record, validate-against-shape]
see-also: [infer-type]
---

# Check type

The substrate operation that verifies a value conforms to a declared [type](teaching/explanations/type.md), or that an expression's actual type matches its declared type.

## Signature

`check-type(value-or-expression, declared-type) → (verdict, witness)`

Inputs:

- **`value-or-expression`** — what's being type-checked.
- **`declared-type`** — reference to the [type-record](../objects/type-record.md) being checked against.

Outputs:

- **`verdict`** — `valid`, `invalid` (with explanation), `undecided` (for undecidable refinement-type cases).
- **`witness`** — records the check.

## Operational semantics

For primitive/record/union types: structural check that the value's shape matches the type.
For function types: signature compatibility check (parameter count, parameter types, return type).
For polymorphic types: type-variable instantiation check.
For refined types: per [refined-type](teaching/explanations/refined-type.md), apply the refinement predicate; for undecidable predicates, the verdict may be `undecided` or call out to an SMT solver.

Per [cost-discipline-reads-free](../../../theorems/cost-discipline-reads-free.md), check-type is a substrate read; per [settlement-determinism](../../../theorems/settlement-determinism.md), the verdict is deterministic on inputs.

## Position in the platform

Check-type is the substrate's *type-validation primitive*. Per [function-record](../objects/function-record.md)'s invariants, function bodies must type-check against their signatures. Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), type-checking is a conformance property.
