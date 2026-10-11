---
type: definition
class: substrate-entity
realizes: [capability, capability-passing]
depends-on: [capability, capability-passing, agent-record, witness]
see-also: [function-record]
---

# Capability record

A **capability record** is the substrate-entity formal definition of a [capability](teaching/explanations/capability.md): the predication-graph entity declaring a particular authority token.

## Structural fields

- **`id`** — kebab-case identifier (e.g., `write-on-document-foo-by-emsenn`).
- **`description`** — one-line summary.
- **`operation`** — what the capability authorizes: `read`, `write`, `invoke`, `delegate`, custom.
- **`resource`** — reference to the substrate entity, scope, or sublocale the capability applies to.
- **`holder`** — reference to the [agent-record](../../agential-orchestration-platform/objects/agent-record.md) currently holding the capability. May be a function-invocation context for capabilities passed during a call.
- **`granted-by`** — reference to the authority that granted the capability (an office-record, a parent capability that delegated).
- **`granted-at`** — substrate ordinal of grant.
- **`revoked-at`** — substrate ordinal of revocation, when applicable.
- **`expires-at`** — for time-bounded capabilities, the substrate ordinal at which the capability expires.
- **`provenance`** — predications declaring how the capability was obtained (granted by authority, derived by delegation from parent capability).
- **`closure-kind`** — `capability`.

## Invariants

- **Holder-bound.** Every capability has a current holder (or is in transit between holders during a capability-passing event).
- **Resource-resolvable.** The cited resource must exist and be appropriate for the capability's operation.
- **Provenance-traceable.** Per [witness](../../../objects/witness.md), the capability's grant chain is auditable back to an authority.
- **Revocation-effective.** Once revoked, the capability cannot be used; per [witness](../../../objects/witness.md), revocation produces a witness.

## Position in the platform

Capability records are the substrate's *authority-token registry*. Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), capabilities are the substrate-side instance of the modal accessibility relation; per [witness](../../../objects/witness.md), capability use is auditable.
