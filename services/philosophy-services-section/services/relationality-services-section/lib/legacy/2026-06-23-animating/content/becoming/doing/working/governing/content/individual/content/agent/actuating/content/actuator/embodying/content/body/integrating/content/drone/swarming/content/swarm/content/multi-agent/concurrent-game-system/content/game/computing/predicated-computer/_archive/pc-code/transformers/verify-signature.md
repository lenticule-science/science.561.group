---
type: morphism
class: cryptographic-operation
realizes: [signature]
depends-on: [identity-record, signature, hash-discipline, canonical-form]
see-also: [sign, federation-handshake]
---

# Verify signature

The substrate operation that checks whether a [signature](teaching/explanations/signature.md) over a content artifact verifies against the cited [identity record](../objects/identity-record.md)'s public key. Verify-signature is the substrate's primary attribution-checking operator and is the verification side of [sign](sign.md).

## Signature

`verify-signature(signature, content) → verification-result`

Inputs:

- **`signature`** — a signature record produced by [sign](sign.md) or received from a federated peer.
- **`content`** — references to the content the signature claims to be over.

Outputs:

- **`verification-result`** — one of: `valid`, `invalid-signature`, `revoked-key`, `expired-key`, `unknown-key`, `content-hash-mismatch`. Each non-valid outcome carries a diagnostic message.

## Operational semantics

Verify-signature proceeds in five steps:

1. Compute the canonical-form hash of the content per [hash-discipline](teaching/explanations/hash-discipline.md).
2. Compare against the signature's recorded content-hash. Mismatch produces `content-hash-mismatch` (the content the signature claims to be over differs from the content provided).
3. Resolve the signature's `identity-record-id` to a substrate-resident identity record. Missing produces `unknown-key`.
4. Check the identity record's validity period and revocation status against the signature's timestamp. Out-of-period produces `expired-key`; revoked produces `revoked-key`.
5. Use the identity record's `scheme` and `public-key-bytes` to verify the signature value against the content-hash. Verification failure produces `invalid-signature`; success produces `valid`.

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), verify-signature is a *read* of substrate state — it does not advance history, does not emit a state-changing witness, does not consume settlement fuel. It may emit a verification-record at the caller's request (audit instrumentation), but the verification itself is free.

## Engineering invariants

- **Deterministic on substrate state.** Two verify-signature calls with the same `(signature, content)` against the same identity-record state produce the same result. Per [settlement-determinism](../theorems/settlement-determinism.md), this holds across substrates.
- **Reads-free per cost-discipline.** Verify is a substrate read; per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), it produces no state change.
- **Scheme-aware.** The cited identity-record's `scheme` determines the verification procedure. A signature whose scheme doesn't match the identity-record's scheme is rejected as `invalid-signature`.
- **Time-aware.** The signature's timestamp is checked against the identity-record's validity period. Verification of an expired-key signature, even if cryptographically valid, returns `expired-key`.

## Failure modes

The non-valid result codes are not failures of verify-signature itself — they are correct outcomes of verification on inputs that don't satisfy the verification predicate. The caller's response to each is policy:

- **`content-hash-mismatch`**: content has been tampered or the wrong content was provided. Reject the artifact.
- **`unknown-key`**: the cited identity-record is not in the substrate. Either the substrate hasn't received the identity record yet, or the signature cites a forgery. Reject pending identity-record admission, or reject permanently if the citation is unresolvable.
- **`expired-key`**: the signature was made under a key past its validity period. Reject; the artifact is not currently authoritative even if it was at signing time.
- **`revoked-key`**: the key has been revoked. For `revoked` status, the artifact may still be admissible if dated before revocation; for `compromised` status, the artifact is suspect at any time. Policy decides.

## Position in the substrate

Verify-signature is the operator that *checks* substrate-content attribution. Per [federation-convergence](../theorems/federation-convergence.md), every federated message is verified at admission; per [witness](../objects/witness.md), witnesses crossing trust boundaries are verified before being added to the recipient's audit chain; per [snapshot](../objects/snapshot.md), snapshots' signatures are verified before unpacking. The substrate refuses any artifact whose verification doesn't return `valid`.
