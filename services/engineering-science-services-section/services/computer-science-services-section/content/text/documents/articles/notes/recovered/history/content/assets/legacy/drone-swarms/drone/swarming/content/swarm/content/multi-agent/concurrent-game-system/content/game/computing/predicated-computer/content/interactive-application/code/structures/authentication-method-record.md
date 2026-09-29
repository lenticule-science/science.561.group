---
type: definition
class: substrate-entity
realizes: [authentication-method]
depends-on: [authentication-method, account-record, encryption]
see-also: [account-record]
---

# Authentication method record

A **authentication method record** is the substrate-entity formal definition of an [authentication method](teaching/explanations/authentication-method.md) bound to an [account](teaching/explanations/account.md).

## Structural fields

- **`id`** — kebab-case identifier (e.g., `password-emsenn-primary`, `mfa-totp-emsenn-2026`).
- **`description`** — one-line summary.
- **`bound-account`** — reference to the [account-record](account-record.md) this method is for.
- **`method-kind`** — `password`, `mfa-totp`, `mfa-webauthn`, `sso-google`, `sso-github`, `oauth`, `public-key`, `recovery-key`, `biometric`.
- **`secret-storage`** — encrypted reference to the method's secret. For password: salted+hashed password digest, encrypted-at-rest per [encryption](../../teaching/explanations/encryption.md). For MFA-TOTP: encrypted seed. For SSO: provider-specific configuration. For public-key: reference to the [identity-record](../../../objects/identity-record.md). For biometric: reference to host-managed biometric subsystem.
- **`is-primary`** — whether this is the account's primary authentication method (vs. additional factor or recovery).
- **`is-required`** — whether authentication via this method is required (e.g., MFA second-factor that must be present in addition to primary).
- **`created-at`**, **`rotated-from`** — for key/secret rotation, the predecessor method this one replaces.
- **`retired-at`** — substrate ordinal of retirement, when applicable.
- **`failure-count`** — derived count of recent authentication failures via this method. Used for lockout-policy enforcement.
- **`closure-kind`** — `authentication-method`.

## Invariants

- **Encrypted secret.** Per [encryption](../../teaching/explanations/encryption.md), the method's secret-storage is encrypted-at-rest. Plaintext secrets are inadmissible.
- **Account-bound.** Every method record references its account; orphan methods are inadmissible.
- **Method-kind-coherent.** The `secret-storage` shape matches the `method-kind` (a password method has hashed-password storage; an SSO method has provider configuration; etc.).
- **Rotation-chain acyclic.** Per [identity-record](../../../objects/identity-record.md)'s rotation discipline, the `rotated-from` chain must terminate at an initial method.

## Position in the platform

Authentication method records are the substrate's *per-account authentication registry*. Per [witness](../../../objects/witness.md), every authentication attempt produces a witness citing the method record; auditors can review which method was used and whether it succeeded.
