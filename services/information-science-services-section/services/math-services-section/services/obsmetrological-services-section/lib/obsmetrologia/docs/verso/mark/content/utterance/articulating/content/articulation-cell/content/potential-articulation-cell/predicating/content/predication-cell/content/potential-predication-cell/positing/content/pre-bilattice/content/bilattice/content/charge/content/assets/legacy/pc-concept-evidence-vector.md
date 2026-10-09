---
type: concept
class: substrate-content
depends-on: [hash-discipline, canonical-form, witness, witness-chain-as-proof-object, repair-log-hash-chain-as-per-artifact-merkle-projection, hash-injectivity-under-canonical-form]
see-also: [stratified-cell-atom, settlement-determinism, federation-trust-bilattice-graded, evidence-vector-as-canonical-binding-attestation]
---

# Evidence vector

An **evidence vector** is the substrate's flat, ordered sequence of canonical-form SHA-256 hex digests proving that a specific `respond` invocation processed canonical inputs and produced canonical outputs with a documented sequence of repair steps. It is the cryptographic *binding* artefact emitted by the substrate's response pipeline — distinct from the [witness chain](witness.md) per-atom proof object emitted by the closure engine.

The evidence vector is **optional** at the protocol level (a client requests it via a flag) but a deterministic substrate MUST be able to produce it on demand for any past or current `respond` invocation.

## Structural shape

For a `respond` invocation, the evidence vector is a flat array of hex digests in the following fixed order:

1. **Input target hash** — SHA-256 of the canonical bytes of the target reference (`{"slug": "<target>"}` canonicalized).
2. **Input payload hash** — SHA-256 of the canonical payload object.
3. **Input sender hash** — SHA-256 of `{"slug": "<sender>"}` if a sender is present; omitted otherwise.
4. **Repair-log entry hashes** — for each entry $e_i$ in the canonical repair log, in trajectory order, the SHA-256 of the canonical-form encoding of $e_i$.
5. **Output target_fiber hash** — SHA-256 of the canonical bytes of the settled fiber, present only on `status: "ok"`. Replaced by `sha256(canonical({"code": code}))` on `status: "error"`.
6. **Settled-at-ord witness** — SHA-256 of `{"ord": <integer>}`, present only on `status: "ok"`.

The vector is *flat* — no nesting, no per-section delimiters. Order is fixed; presence is conditional per the table above.

## What the vector binds

The vector is a binding of the canonical-form bytes of *six categories of substrate content*: the target, the payload, the sender, each repair-log entry, the output fiber (or error code), and the settled-at-ord witness. Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), each digest uniquely identifies its content modulo collision-resistance. The vector therefore commits the producing substrate to:

- These exact canonical-form input bytes were observed.
- This exact sequence of repair-log entries was emitted, in this order.
- This exact canonical-form output fiber (or error code) was produced.
- (For successful invocations) settlement reached this exact ordinal.

The binding is *external*: a verifier who possesses the canonical inputs, the canonical outputs, the repair log, and the evidence vector can recompute each digest and check item-by-item equality. Mismatch is `PCM_EVIDENCE_INVALID`, a hard failure indicating either non-deterministic execution or transcript tampering.

## What the vector does not bind

The evidence vector does *not* attest to derivation correctness. Specifically, the vector does not commit:

- That the closure engine, given the bound inputs, would actually produce the bound repair log under a fresh re-execution.
- That each repair-log entry's `before_hash → after_hash` transition is the result of applying a valid closure rule.
- That the output fiber is the σ/Δ closure of the input payload under the substrate's rule system.

These are the content of the [witness chain as proof object](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/witness-chain-as-proof-object.md) discipline — a *separate* attestation surface. The witness chain encodes per-atom derivation steps with operator and rule identifiers, sufficient to drive proof-checking by *re-execution*. The evidence vector encodes only the canonical-form hash binding, sufficient to drive replay-attestation by *re-canonicalisation*.

The two attestation surfaces are *complementary*, not redundant:

| Property | Evidence vector | Witness chain |
|---|---|---|
| What it binds | Canonical-form bytes of inputs, repair entries, and outputs | Per-atom derivation steps with operators and rules |
| Verification cost | $O(n)$ canonical-form recompute and hash comparison | $O(\text{re-execute closure rules})$ |
| Verifier requires | Canonical-form serialiser, hash function | Full closure engine, rule system, fiber algebra |
| What attestation it provides | "These bytes were the observed inputs, repair, outputs" | "These derivations are valid in the substrate's rule system" |
| What it cannot detect | A mathematically incorrect closure rule that the producing substrate consistently applies | A canonical-form serialisation that elides a field the verifier expected |

A federation peer claiming to have correctly executed a `respond` invocation may ship the evidence vector (cheap to verify, proves the producer's commitment to the bytes) and/or the witness chain (expensive to verify, proves the derivations are sound). The dev spec's evidence-vector profile ships the former by default; clients requiring stronger attestation request the witness chain via the [witness-chain-as-proof-object](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/witness-chain-as-proof-object.md)-discipline read surface.

This distinction is load-bearing: a verifier who treats evidence-match as derivation-correctness is over-trusting the producer. The substrate's discipline is to be explicit — evidence is *binding-attestation*; witness is *derivation-attestation*. See [evidence-vector-as-canonical-binding-attestation](../theorems/evidence-vector-as-canonical-binding-attestation.md) for the structural argument.

## Persistence

When the substrate's evidence profile is enabled (configured per-node, default off in development, default on in production), each `respond` invocation produces an evidence file at `$ROOT/evidence/<exec-id>.json` with content:

```
{
  "request":  <canonical request>,
  "response": <canonical response>,
  "evidence": [<hex digest>, ...]
}
```

`<exec-id>` is the message id from the originating MCP request, or, for internal heartbeat-driven `respond` calls, an autogenerated UUID. The filename is opaque (the exec-id), not content-derived; same exec-id always produces the same file content if the underlying respond was deterministic.

The evidence file's *contents* are canonical JSON; the *filename* is opaque. This is the inverse of the substrate's content-addressed storage discipline elsewhere — a deliberate choice, because the evidence-file's purpose is per-invocation lookup by exec-id, not deduplication by content.

## Relationship to the per-artifact repair-log chain

The evidence vector includes the SHA-256 of each repair-log entry in trajectory order — but not the per-artifact `before_hash`/`after_hash` chain that runs through the entries. The chain identity per [repair-log-hash-chain-as-per-artifact-merkle-projection](../theorems/repair-log-hash-chain-as-per-artifact-merkle-projection.md) is *encoded inside* each entry (the entry's canonical bytes include its `before_hash` and `after_hash` fields), so the entry's hash binds the chain link by transitivity. A verifier wanting to check chain integrity must additionally:

1. Verify each entry's `after_hash` equals the canonical hash of the artifact after applying the entry's effect.
2. Verify the per-artifact contiguity: $e_{i_j}.\text{after\_hash} = e_{i_{j+1}}.\text{before\_hash}$ on the projected per-artifact subsequence.

The evidence vector alone is not sufficient for (1) — that requires re-canonicalising the artifact's pre- and post-application bytes, which is more expensive than the evidence vector's flat hash check. The evidence vector is sufficient for (2) — the per-artifact contiguity is a property of the entry contents, encoded in their canonical bytes, and the evidence-vector entries' hashes bind the entry contents.

This is the structural reason the evidence vector is *complementary* to the per-artifact chain audit, not a replacement for it. A federation peer with full audit responsibilities runs both checks; a peer with cheaper trust requirements runs only the evidence-vector check.

## Failure-mode evidence

Even on `status: "error"`, the substrate emits a producible evidence vector. The shape replaces the `target_fiber` hash and `settled_at_ord` witness with `sha256(canonical({"code": code}))`:

```
expected = []
expected.push(sha256(canonical({"slug": target})))
expected.push(sha256(canonical(payload)))
if sender: expected.push(sha256(canonical({"slug": sender})))
for entry in repair_log:
    expected.push(sha256(canonical(entry)))
expected.push(sha256(canonical({"code": code})))
```

The error code's hash is the terminal element. This means the substrate's evidence discipline applies uniformly: every respond — successful or not — has a verifiable evidence vector. A substrate that omits the evidence vector on errors loses the structural property that *all* substrate operations are auditable.

## Position

The evidence vector is the substrate's commitment to a *cheaply-verifiable cryptographic binding* of every `respond` invocation. Its purpose is replay-attestation, federation trust at low cost, conformance certification, and audit. Its limits — that it does not attest derivation correctness — are structural, not deficiencies. The substrate's discipline pairs the evidence vector with the [witness chain](witness.md) as complementary attestation surfaces:

- The evidence vector is the *short* attestation: $O(\text{repair-log size} + \text{constant})$ in size, $O(n)$ in verification cost, sufficient to detect transcript tampering and non-determinism.
- The witness chain is the *full* attestation: $O(\text{trajectory size})$ in size, $O(\text{re-execute closure rules})$ in verification cost, sufficient to detect derivation faults.

A federation handshake or audit query may request either or both, depending on the trust contract between peers. The substrate emits both deterministically; per [settlement-determinism](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md) and [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), both are reproducible from the substrate's event log alone.
