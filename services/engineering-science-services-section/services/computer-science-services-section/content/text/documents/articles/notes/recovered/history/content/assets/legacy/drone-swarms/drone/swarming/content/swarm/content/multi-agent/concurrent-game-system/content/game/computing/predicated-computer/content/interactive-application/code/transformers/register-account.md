---
type: morphism
class: account-operation
realizes: [account, user]
depends-on: [account-record, user-record, authentication-method-record, identity-record]
see-also: [authenticate-user]
---

# Register account

The substrate operation that creates a new [account-record](../objects/account-record.md), a new [user-record](../objects/user-record.md) (if the user doesn't exist), and the initial [authentication-method-record](../objects/authentication-method-record.md). Register-account is the substrate-level entry point for new users.

## Signature

`register-account(account-handle, user-info, initial-authentication-method) → (user-record, account-record, authentication-method-record, witness) | (rejection, witness)`

Inputs:

- **`account-handle`** — the new account's user-facing handle.
- **`user-info`** — display name, profile predications.
- **`initial-authentication-method`** — the method to set up: password (with plaintext that gets hashed), public key, SSO provider info, etc.

Outputs:

- **Three new substrate records** plus a witness chain recording their creation.
- **Rejection** — handle conflict, invalid initial method, registration policy refusal.

## Operational semantics

1. *Validate handle uniqueness.* Per [account-record](../objects/account-record.md)'s invariants, no two accounts share a handle within scope.
2. *Generate identity-key.* Per [identity-record](../../../objects/identity-record.md)'s discipline, generate a key-pair at the host environment, sign the public component into the substrate.
3. *Create user-record.* Insert per [insertion](../../../morphisms/insertion.md).
4. *Create account-record.* Insert with `bound-user` and `bound-identity-key` references.
5. *Create authentication-method-record.* Per [encryption](../../teaching/explanations/encryption.md), the method's secret is encrypted-at-rest before storage.
6. *Witness emit.* Per [witness](../../../objects/witness.md), record the registration. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the registration is non-repudiably attributed to the registering entity.

## Engineering invariants

- **Atomic.** The three records (or four if creating a new agent-record too) are inserted atomically; partial registrations are inadmissible.
- **Witness-emitted.** Per [settlement-determinism](../../../theorems/settlement-determinism.md), the registration is replayable.
- **Policy-respecting.** Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), registration may require governance-decision approval depending on the substrate's account-policy.
