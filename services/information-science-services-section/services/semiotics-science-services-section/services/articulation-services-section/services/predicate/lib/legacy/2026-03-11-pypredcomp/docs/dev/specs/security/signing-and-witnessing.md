---
title: "Signing and witnessing"
description: "Ed25519 signatures on every authoritative event. Witness chains as Merkle audit. The substrate's source of trust is the signature."
kind: spec
status: normative
version: "0.2"
---

# Signing and witnessing

Every event the substrate appends to the log can be signed; events from federation peers MUST be signed; capability cells MUST be signed by their delegator.
Signatures use Ed25519 per [decisions/federation-signatures-ed25519.md](../../decisions/federation-signatures-ed25519.md).

The witness chain — the per-respond record of the rules fired and the cells produced — provides Merkle-style audit: any past state's derivation is verifiable from the event log.

## Grounded in

- [`predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/modal-restriction-as-substrate-authorization-primitive.md) — every $\Box_R$ evaluation across the six authorization surfaces produces a witness on the same chain (§2); the witness chain is the substrate-uniform record of authorization decisions, not a per-subsystem audit.
  Per [decisions/authorization-is-modal-restriction.md](../../decisions/authorization-is-modal-restriction.md).
- [`predicated-computing/theorems/hash-injectivity-under-canonical-form`](../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) — the witness chain's Merkle DAG (§2) and the cross-implementation determinism guarantee (§4) rest on hash-injectivity: same canonical bytes always produce same SHA-256 digest, distinct canonical bytes produce distinct digests, so witness predecessor pointers form a tamper-evident chain by construction.
- See [_patterns/predicated-computing-grounding.md](../_patterns/predicated-computing-grounding.md) for the engineering-layer index.

## 1. Signature model

### Keys

Each personnel and persona-agent has an Ed25519 keypair:

```json
{
  "kind": "key",
  "holder": "personnel:emsenn",
  "public-key": "<base64-32-bytes>",
  "private-key-location": "<filesystem-path-or-keystore-uri>",
  "purpose": "signing"
}
```

The private key is held by the person; the public key is a substrate cell.
The substrate verifies signatures using the public key; the substrate never sees the private key.

Each peer node has a node keypair under the same shape.
Federation receive verifies events against the peer's public key.

### Event signing

When a personnel-attributed event is appended:

1. Compute the canonical bytes of the event without the `signature` field.
2. Sign the canonical bytes with the personnel's private key (via the host's keystore).
3. Append the event with the signature included.

Signature placement: at the event envelope level, alongside `peer`, `wall_clock_at`.
Per [event-log.md](../filesystem/event-log.md).

### Verification

On read or replay:

1. Look up the signing entity's public key (substrate cell).
2. Recompute canonical bytes without `signature`.
3. Verify the signature matches.

Failed verification: `PCF_SIGNATURE_INVALID`.
The event is rejected; the event log does not advance.

## 2. Witness chains

A **witness** is the audit record of one closure-rule firing or one settle invocation.
It contains:

```json
{
  "kind": "witness",
  "exec-id": "<sha256>",
  "rule-id": "<sha256>",
  "input-fiber-hash": "<sha256>",
  "output-fiber-hash": "<sha256>",
  "rule-version": "<sha256>",
  "fuel-consumed": 4,
  "fired-at-ord": 12345,
  "session-id": "<entity-slug>",
  "signature": "<base64>"
}
```

Witnesses chain via predecessor pointers:

```json
{
  ...
  "previous-witness": "<sha256>"
}
```

The chain forms a Merkle DAG: any witness's authenticity verifies against its predecessor's hash; tampering anywhere is detectable by re-walking.
The chain is the substrate's audit primitive.

## 3. The audit operation

`witness <cell-id>` returns:

1. The cell's current value.
2. The chain of witnesses that led to that value.
3. For each witness: the rule that fired, the session that fired it, the timestamp (event-ordinal), the signatures in that witness's authentication path.

This is the substrate's `git log --follow <file>` analogue, but stronger: the witness chain is cryptographically authenticated, not just historical.

## 4. Cross-implementation determinism

Both Python and Rust implementations:

- Compute byte-identical canonical bytes for the same event.
- Produce byte-identical signatures (Ed25519 is deterministic with fixed nonce per RFC 8032).
- Produce byte-identical witness records for the same firing.

Cross-language conformance verifies this.

## 5. Federation signature flow

When a peer A pushes an event to peer B:

1. A's event is signed with A's node private key.
2. The federation envelope contains the signature.
3. B verifies against A's known public key (a substrate cell on B with `(peer:A, public-key, ...)
  `).
4. On valid signature, B applies the event under sender = `peer:A`; the event's effect is bounded by A's federation-trust capability fiber.
5. On invalid signature, B rejects with `PCF_SIGNATURE_INVALID`.

See [federation-protocol.md](../network/federation-protocol.md), [federation-trust.md](federation-trust.md).

## 6. Signing key lifecycle

- **Creation.** A personnel's keypair is generated by their host using `openssl genpkey -algorithm ed25519` or equivalent.
  The public key is added as a substrate cell; the private key is held by the personnel.
- **Distribution.** Public keys propagate via federation events; the substrate cell containing them is shareable.
- **Rotation.** A personnel may rotate keys: assert a new public key cell; retire the old one with a `key-retire` event signed by both keys (proving control of both).
- **Revocation.** A compromised key is retired immediately; events signed after the retirement event are rejected; events before are honored.
- **Expiration.** Keys MAY have an `expires-at-ord` predicate; expired keys are equivalent to retired.

## 7. Witness signing

Witnesses are signed by the session that produced them.
The session's capability fiber composes with the personnel's signing capability; the witness is signed using the session's authorized signing key.

For automated agents (running under personnel authority), witnesses are signed by the personnel's signing key (per the session's capability fiber).
Persona-agents have their own keys; their witnesses are signed by the persona, not the operating personnel.

## 8. Errors

| Code | Meaning |
|---|---|
| `PCF_SIGNATURE_INVALID` | Signature did not verify against the named public key. |
| `PCF_KEY_UNKNOWN` | The signing entity's public key isn't a substrate cell. |
| `PCF_KEY_RETIRED` | The signing key was retired before the event's ord. |
| `PCF_KEY_EXPIRED` | The signing key's `expires-at-ord` has passed. |
| `PCF_WITNESS_CHAIN_BROKEN` | A witness's `previous-witness` doesn't match the actual predecessor. |
| `PCF_WITNESS_HASH_MISMATCH` | A witness's `output-fiber-hash` doesn't match the recomputed hash. |

## 9. Implementation

### Python (v0.1+)

- `cryptography.hazmat.primitives.asymmetric.ed25519` for sign/verify.
- Canonical-byte computation in `substrate/canonicalization.py`.
- Witness records as pydantic `Witness` models; chain validation in `substrate/witness.py`.

### Rust (v0.2+)

- `ed25519-dalek` for sign/verify.
- Canonical bytes via `serde_json` with sorted-key configuration.
- Witness records as serde-derived structs.

## 10. Conformance

Signing/witnessing passes:

1. **Round-trip signing.** Sign a canonical event; serialize; deserialize; verify; signature checks.
2. **Cross-language equivalence.** Python and Rust produce byte-identical signatures for identical inputs and keys.
3. **Witness chain integrity.** A 100-witness chain replays to byte-identical fiber state; tampering with any witness fails verification.
4. **Federation rejection.** Invalid signatures rejected with `PCF_SIGNATURE_INVALID`.
5. **Key rotation.** Rotation event signed by both keys; subsequent events under the new key only.

## 11. Plan 9 / Unix analogue

| Unix concept | Signing analogue |
|---|---|
| GPG signatures | Ed25519 signatures on events |
| `git commit -S` | Every event is signed by default |
| `~/.ssh/authorized_keys` | Public-key cells in the substrate |
| `gpg --keyserver` | Federation-distributed public-key cells |
| `git log --show-signature` | The witness operation |
| Audit log (auditd) | The event log itself, plus the witness chain |
