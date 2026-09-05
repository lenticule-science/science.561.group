---
type: concept
class: cryptographic-attestation
depends-on: [identity-key, hash-discipline, canonical-form, witness, hash-injectivity-under-canonical-form, predication-fibration]
see-also: [encryption, federation-as-substrate-join, signature-binds-witness-to-identity]
---

# Signature

A cryptographic attestation that a substrate artifact (a [witness](../objects/witness.md), a [reified message](reification.md), a [snapshot](../objects/snapshot.md)) was produced by the holder of a particular [identity key](identity-key.md). In the substrate's hyperdoctrine setting, a signature is not just a cryptographic byte-string — it is *the substrate-side computational realization of canonical-form-hash uniqueness*: the signing operation binds an entity's identity-key to a specific point in the substrate's [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), and verification is the substrate-level test that this point in the fibration was produced by that identity. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the cryptographic discipline is what makes the substrate's accessibility relation $R$ (per [trust-boundary-modal-validity](../theorems/trust-boundary-modal-validity.md)) structurally enforceable.

A signature is the substrate's mechanism for *attribution* — the cryptographically-checkable answer to "who produced this content?"

## Hyperdoctrinal grounding

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the canonical hash uniquely determines the underlying value (modulo collision-resistance). A signature is computed over the canonical-form hash of the content, so:

- The signing input is structurally a *point in the substrate's fibration* — the canonical-form representative of the value being signed.
- The signing operation produces a cryptographic byte-string that binds an identity-key to that point.
- Verification recomputes the canonical hash and checks the signature against the entity's known public key.

Per the chain *value $\to$ canonical form $\to$ hash $\to$ signature*, the signature is a faithful attestation: changing any step changes the result. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), this faithful attestation is what advances the substrate's accessibility relation $R$ from $\bot$ (uninformed) to $\mathbf{t}$ (told-true) on a peer's identity — without the signature, the substrate has no structural basis for trusting the peer's identity claim.

A signature is computed over the [canonical-form](canonical-form.md) [hash](hash-discipline.md) of the content, so two artifacts with the same canonical content produce the same hash and therefore the same signing input. By [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), distinct canonical content produces distinct signatures (modulo the hash's collision resistance and the signature scheme's existential unforgeability).

## Three engineering uses of signatures in the substrate

- **Witness attribution.** Per [witness](../objects/witness.md), every operator execution emits a witness; signatures on witnesses bind the witness to the producing entity's identity key. An auditor verifying a witness checks the signature against the entity's known public key. Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the witness chain is the substrate's Curry-Howard proof object; signatures are the attribution layer on top of the proof structure.
- **Federated-message attribution.** Per [federation-convergence](../theorems/federation-convergence.md), federated messages cross substrate boundaries. The receiving substrate verifies the message's signature against the sending entity's identity key (looked up in the [federation-graph](theories/agential-orchestration-platform/objects/federation-graph.md)'s identity registry); messages whose signatures don't verify are rejected at the boundary. Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), signature-verified peers move to $\mathbf{t}$-trust in the federation accessibility relation.
- **Snapshot signing.** Per [snapshot](../objects/snapshot.md), a snapshot's metadata is signed by the producing substrate's identity key. A peer receiving the snapshot verifies the signature; signed snapshots are admissible across substrate boundaries. Per [backup-as-cohomology-preservation](../theorems/backup-as-cohomology-preservation.md), the signed snapshot's restoration preserves the substrate's structural cohomology, with the signature attesting to the originating substrate.

## Structural fields

A signature has structural fields:

- The signed content's canonical-form hash (so the signature is verifiable without re-canonicalizing).
- The signing entity's identity-key reference (which public key to verify against).
- The signature value itself (the cryptographic byte string).
- The signature scheme identifier (Ed25519, RSA, etc.) — required because different schemes have different verification procedures.
- A timestamp (informational; not consulted for verification correctness).

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the canonical-form hash field uniquely determines the underlying signed content (modulo collision-resistance). The signature is therefore a structurally-faithful attestation: any modification to the content changes the hash, invalidating the signature.

## Position

Signatures compose with the substrate's audit chain: per [witness](../objects/witness.md), the witness chain is byte-comparable across hosts because canonical-form hashes are deterministic, and signatures bind each witness to its producer. Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the witness chain is a Curry-Howard proof object; signatures are the attribution layer on top of the proof structure.

An auditor verifying the chain validates each signature in sequence; a broken signature in the chain is a tampering or impersonation event the substrate must surface. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the verification's structural correctness follows from the canonical-form-hash uniqueness composed with the cryptographic scheme's existential unforgeability — neither layer is independently sufficient; both are required for the substrate's attribution discipline.
