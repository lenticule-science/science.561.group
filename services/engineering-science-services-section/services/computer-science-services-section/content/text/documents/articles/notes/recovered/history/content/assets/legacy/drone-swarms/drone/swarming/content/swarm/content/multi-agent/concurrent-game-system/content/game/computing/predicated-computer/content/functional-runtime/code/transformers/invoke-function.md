---
type: morphism
class: evaluation-operation
realizes: [function, closure]
depends-on: [function-record, capability-record, runtime-record, settlement-determinism]
see-also: [evaluate, exercise-capability]
---

# Invoke function

The substrate operation that calls a [function](teaching/explanations/function.md) (or [closure](teaching/explanations/closure.md)) with given arguments and capabilities, producing the function's return value and a witness of the invocation.

## Signature

`invoke-function(function-record-id, arguments, passed-capabilities, runtime-context) → (return-value, invocation-witness)`

Inputs:

- **`function-record-id`** — reference to the [function-record](../objects/function-record.md) to invoke.
- **`arguments`** — values matching the function's parameter types.
- **`passed-capabilities`** — references to [capability-records](../objects/capability-record.md) the caller is passing to the callee per [capability-passing](teaching/explanations/capability-passing.md).
- **`runtime-context`** — reference to the [runtime-record](../objects/runtime-record.md) executing the invocation.

Outputs:

- **`return-value`** — the function's result.
- **`invocation-witness`** — records the invocation: function-id, argument-hashes, passed-capability-ids, return-value-hash, effects performed.

## Operational semantics

1. *Type-check arguments.* Per [check-type](check-type.md), verify arguments match the function's parameter types.
2. *Capability check.* Verify all required capabilities (per the function-record's `required-capabilities`) are passed.
3. *Resolve closure.* For closures, merge the captured environment into the parameter scope.
4. *Evaluate.* Per [evaluate](evaluate.md), execute the function's body under the cited runtime.
5. *Effect tracking.* Record effects performed against the function's declared effect set.
6. *Witness emit.* Per [settlement-determinism](../../../theorems/settlement-determinism.md), pure-function invocations replay byte-identically; effectful invocations replay deterministically given the same capability state.

## Engineering invariants

- **Type-checked.** Per [function-record](../objects/function-record.md), arguments must match parameter types.
- **Capability-respecting.** Per [capability-passing](teaching/explanations/capability-passing.md), the function uses only passed capabilities.
- **Effect-bounded.** Per [function-record](../objects/function-record.md)'s effect declaration, the function's actual effects must be a subset.
- **Witness-emitted.** Per [witness](../../../objects/witness.md), every invocation produces a witness.
