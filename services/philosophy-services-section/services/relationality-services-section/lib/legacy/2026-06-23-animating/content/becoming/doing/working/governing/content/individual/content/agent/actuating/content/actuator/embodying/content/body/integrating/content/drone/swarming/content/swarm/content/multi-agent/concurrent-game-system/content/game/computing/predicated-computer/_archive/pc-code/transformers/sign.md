---
type: morphism
class: cryptographic-operation
realizes: [signature]
depends-on: [identity-record, hash-discipline, canonical-form, witness]
see-also: [verify-signature, emit-witness]
---

# Sign

The substrate operation that produces a [signature](teaching/explanations/signature.md) over a content artifact using a holder's [identity record](../objects/identity-record.md). Sign is the substrate's primary cryptographic-attestation operator.

## Signature

`sign(content, identity-record-id) → signature`

Inputs:

- **`content`** — references to the content being signed: a [witness](../objects/witness.md), a [reified message](teaching/explanations/reification.md), a [snapshot](../objects/snapshot.md)'s metadata, or any substrate region with a canonical-form hash.
- **`identity-record-id`** — the holder's identity-record reference. The holder's host environment must possess the corresponding private key.

Outputs:

- **`signature`** — a [signature](teaching/explanations/signature.md) record carrying the signed content's canonical-form hash, the cited identity-record-id, the signature value, the signature scheme, and a creation timestamp.

## Operational semantics

Sign proceeds in three steps:

1. Compute the canonical-form hash of the content per [hash-discipline](teaching/explanations/hash-discipline.md). Two artifacts with the same canonical content produce the same hash.
2. Send the hash to the holder's host environment, which uses the private key (under the cited identity-record's `scheme`) to produce the signature value.
3. Assemble the signature record and return it. The signature record is itself substrate content; per the substrate's audit discipline, sign emits a witness for the operation.

The substrate's response when the cited identity-record is invalid (revoked, expired, missing): sign fails with an explicit error; no signature is produced. Per [settlement-determinism](../theorems/settlement-determinism.md), sign's behavior is deterministic on its inputs (identity-record state + content); the substrate replays sign by recomputing the hash and re-signing (when the host has the private key) or by recovering the prior signature from the event log.

## Engineering invariants

- **Canonical-form-hash-bound.** The signature is over the canonical-form hash, not over raw content. Two pieces of content with identical canonical-form produce identical signing inputs.
- **Private-key-not-substrate.** The private key never enters substrate content. The signature operation crosses the substrate's boundary to the host environment for the actual cryptographic computation; per [signature](teaching/explanations/signature.md), this is the only point at which the substrate touches private-key material.
- **Witness-emitted.** Every sign operation produces a witness recording the inputs and the resulting signature's hash. Sign is not a free operation per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md); it produces substrate state (the signature record) and consumes settlement fuel.
- **Scheme-determinate.** Sign's output structure is determined by the cited identity-record's `scheme`; an Ed25519 signature has different bytes than an RSA-4096 signature, even over the same content.

## Failure modes

- **Identity-record revoked or expired.** Sign refuses; the substrate emits a refusal-witness with the reason. The caller's response is policy.
- **Host private key inaccessible.** Sign cannot complete (the host's key-management subsystem is unreachable). The substrate surfaces this as a host-failure event; sign retries are admissible but each is its own operation.
- **Identity-record missing.** Sign refuses; the substrate emits a missing-record witness.

## Position in the substrate

Sign is the operator that *attributes* substrate content to its producer. Per [federation-convergence](../theorems/federation-convergence.md), federated messages must be signed; per [witness](../objects/witness.md), witnesses must be signed when crossing trust boundaries; per [snapshot](../objects/snapshot.md), snapshots are signed at production. The substrate's audit chain is byte-comparable across hosts because canonical-form hashes are deterministic, and sign's signatures bind each artifact to its producer.
