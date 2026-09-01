---
type: morphism
class: account-operation
realizes: [authentication-method, account]
depends-on: [account-record, authentication-method-record, verify-signature, signature-binds-witness-to-identity]
see-also: [register-account, open-session]
---

# Authenticate user

The substrate operation that verifies a user's claim of [account](teaching/explanations/account.md) ownership via one or more [authentication methods](teaching/explanations/authentication-method.md). Authenticate-user is the substrate-level gate for opening sessions and acting as a user.

## Signature

`authenticate-user(account-handle, supplied-credentials, required-methods) → (authentication-witness, session-eligible | refusal-witness)`

Inputs:

- **`account-handle`** — the claimed account.
- **`supplied-credentials`** — the user's authentication evidence: password, MFA code, SSO assertion, signed challenge, biometric verification result.
- **`required-methods`** — the substrate's policy on which methods (or method combination) are required.

Outputs:

- **`authentication-witness`** — successful authentication; the user is eligible to [open-session](../../agential-orchestration-platform/morphisms/open-session.md).
- **`refusal-witness`** — authentication failed; the witness records why (wrong credential, expired method, lockout policy, missing required factor).

## Operational semantics

For each required method:

1. Resolve the method-record via the account's `authentication-methods`.
2. Compare the supplied credential against the method's stored secret per the method's verification procedure.
3. Per [verify-signature](../../../morphisms/verify-signature.md) (for public-key methods) or method-specific verification (for password, MFA, SSO), verify the credential.
4. Update the method-record's `failure-count` (resets on success, increments on failure).

If all required methods succeed, emit an authentication-witness binding the authenticating entity to the account.

Per [cost-discipline-reads-free](../../../theorems/cost-discipline-reads-free.md), the verification itself is a read-only operation on substrate state; the witness emission is the (small) substrate-state change.

## Engineering invariants

- **Method-policy-respecting.** Authentication requires every method declared in the substrate's policy; partial authentication is refused.
- **Lockout-respecting.** Methods with elevated failure-count are locked per the substrate's lockout-policy.
- **Witness-emitted on both outcomes.** Successful and failed authentications produce witnesses; auditors can review both.
- **Replay-deterministic.** Per [settlement-determinism](../../../theorems/settlement-determinism.md), authentication outcomes replay deterministically given the substrate's state at authentication time.
