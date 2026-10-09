---
type: morphism
class: capability-operation
realizes: [capability, capability-passing]
depends-on: [capability-record, agent-record, witness, signature-binds-witness-to-identity]
see-also: [request-capability]
---

# Exercise capability

The substrate operation that *uses* a held [capability](teaching/explanations/capability.md) to perform the operation it authorizes. Exercise is the actual invocation of authority — the moment a capability turns from "potential" into "performed."

## Signature

`exercise-capability(capability-record-id, operation-arguments) → (operation-result, exercise-witness)`

Inputs:

- **`capability-record-id`** — reference to the capability being exercised.
- **`operation-arguments`** — arguments to the operation the capability authorizes.

Outputs:

- **`operation-result`** — the result of the authorized operation.
- **`exercise-witness`** — records the exercise: capability-id, holder, operation, arguments, result.

## Operational semantics

1. *Validate capability.* Verify the capability is held by the calling context, not revoked, not expired.
2. *Validate arguments.* Verify the operation arguments are appropriate for the capability's resource and operation kind.
3. *Perform operation.* Execute the operation the capability authorizes.
4. *Witness emit.* Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the exercise is non-repudiably attributed.

## Engineering invariants

- **Capability-required.** Operations protected by capabilities require an exercise-capability call; ambient performance is refused.
- **Holder-checked.** Per [capability-record](../objects/capability-record.md), only the current holder can exercise.
- **Witness-emitted.** Per [witness](../../../objects/witness.md), every exercise is recorded; auditors can trace which capabilities were used when.

## Position in the platform

Exercise-capability is the substrate's *authority-invocation primitive*. Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), exercising a capability is the substrate-side instance of the modal accessibility relation succeeding at the action's world.
