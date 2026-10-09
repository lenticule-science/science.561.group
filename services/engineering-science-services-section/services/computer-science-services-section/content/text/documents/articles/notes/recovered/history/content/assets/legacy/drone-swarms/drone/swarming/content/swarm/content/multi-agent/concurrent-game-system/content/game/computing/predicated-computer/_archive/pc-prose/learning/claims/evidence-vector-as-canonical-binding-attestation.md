---
type: theorem
class: engineering-claim
status: proved
depends-on: [evidence-vector, hash-injectivity-under-canonical-form, canonical-form, settlement-determinism, witness-chain-as-proof-object, repair-log-hash-chain-as-per-artifact-merkle-projection]
see-also: [federation-trust-bilattice-graded, recovery-via-event-log-replay-determinism, audit-content-via-inconsistency-sheaf-cohomology]
---

# Evidence vector as canonical binding attestation

**Claim.** The substrate's [evidence vector](teaching/explanations/evidence-vector.md) is a *canonical binding attestation*: a cryptographic commitment that the producing substrate observed specific canonical-form input bytes, emitted a specific canonical-form repair-log sequence, and produced specific canonical-form output bytes. It is **not** a *derivation attestation*: it does not attest that the closure engine, given the bound inputs, would or did execute the bound derivations correctly. The two attestation strengths are structurally distinct, both emitted by the substrate, and pairing them is the substrate's full-strength attestation contract.

Concretely: evidence-vector verification by a recipient *succeeds* iff the producing substrate's canonical-form bytes for inputs, repair entries, and outputs match the recipient's recomputation of those bytes. Evidence-vector verification *does not* execute closure rules; it does not validate that any repair-entry's `before_hash → after_hash` transition is a sound application of any closure rule.

## Why the binding holds

Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), a canonical-form SHA-256 digest uniquely identifies its content modulo collision-resistance. Each entry of the evidence vector is the canonical-form digest of one of six substrate-content artefacts (target reference, payload, sender, repair-log entry, output fiber or error-code, settled-at-ord witness) per [evidence-vector](teaching/explanations/evidence-vector.md) §1. By injectivity:

- Two evidence vectors that match digit-for-digit imply the producing substrate observed (resp. emitted) exactly the canonical-form bytes the recipient recomputes.
- A mismatch on any element implies either (i) the recipient's canonical-form bytes for that artefact differ from the producer's, or (ii) the producer's canonical-form discipline diverges from the recipient's, or (iii) the transcript was tampered.

Per [canonical-form](teaching/explanations/canonical-form.md), the substrate's canonical-form discipline is deterministic across implementations (no locale-sensitive number formatting, no implementation-dependent serialisation, no field-order ambiguity). Two conformant substrates produce byte-identical canonical-form bytes for the same content. So a mismatch is mechanically attributable to (i) different content (the producer ran a different invocation than the recipient is verifying), (iii) tampering, or (less plausibly) a canonical-form discipline violation in one of the two substrates.

The conjunction is *binding*: by signing or persisting the evidence vector against an exec-id, the producing substrate commits to those canonical-form bytes for that invocation. A subsequent repudiation requires either content forgery (computationally infeasible per the hash's collision-resistance) or canonical-form discipline violation (a conformance fault).

## Why the binding does not extend to derivation

The evidence vector encodes:

- The SHA-256 of each repair-log entry's *canonical-form encoding*. The entry's canonical-form encoding includes its `code`, `before_hash`, `after_hash`, `fuel_used`, and optional `rule_id`/`cell_index`/`peer` fields per the dev spec's [repair-log](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/repair-log.md) §1 entry shape.
- The SHA-256 of the settled output fiber's canonical-form encoding.
- The SHA-256 of input target, payload, sender.

What the entry's canonical bytes *encode*: the producer's claim that this entry occurred in this position, with these hash transitions, attributed to this rule. What they *do not encode*: a verifiable derivation step. The verifier sees `e.rule_id = "r-7"` and `e.before_hash → e.after_hash` but cannot, from the evidence vector alone, confirm:

- That `r-7` is a valid closure rule in the substrate's rule system.
- That applying `r-7` to a fiber whose canonical hash is `e.before_hash` would produce a fiber whose canonical hash is `e.after_hash`.
- That `r-7`'s premise atoms were present in the fiber at the trajectory ordinal of this entry.

The verifier could *recompute* these claims by running the closure rule against the recovered fiber state — which is exactly the witness-chain replay protocol per [witness-chain-as-proof-object](witness-chain-as-proof-object.md). But that work is *outside* evidence-vector verification; evidence-vector verification is purely canonical-form recompute and hash comparison.

This is the load-bearing distinction: a verifier who treats evidence-match as proof-of-correctness is conflating two attestation surfaces. The substrate's discipline keeps them distinct so that callers can choose attestation strength per their trust contract.

## Composability with witness-chain attestation

A producer's full-strength attestation pairs the evidence vector with the per-atom witness chain:

- The evidence vector binds the producer to the canonical bytes of the inputs, repair-log entries, and outputs ($O(\text{constant} + \text{repair-log entries})$ digests, $O(n)$ verification).
- The witness chain attests that the closure rules and operator applications are sound by enabling re-execution ($O(\text{trajectory entries})$ chain entries, $O(\text{re-execute closure rules})$ verification).

The two compose: a verifier with both can verify (a) the producer committed to these bytes and (b) the bytes are derivable from the substrate's rule system. Either alone is partial:

- Evidence vector alone: detects transcript tampering and non-determinism, but does not detect a substrate that consistently applies an incorrect closure rule. ($O(n)$ verification.)
- Witness chain alone: detects derivation faults but does not provide a single-digest binding to the producer's commitment. (Higher verification cost, but more discriminating.)

The dev spec's [evidence-vector](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/evidence-vector.md) §6 lists "federation trust" as a use case. Per this theorem, federation-trust use is *binding-trust*: a peer claiming to have run `respond(...)` proves it bound itself to these bytes, but does not prove the derivation is sound. A federation that requires derivation-soundness must additionally exchange witness chains and re-execute, or trust the peer's substrate-conformance certification (per [conformance-implies-substrate-properties](conformance-implies-substrate-properties.md)).

## Engineering consequences

- **Cheap audit at scale.** A substrate may persist evidence vectors for every respond and selectively persist witness chains. Audit queries that need only binding-attestation run against evidence vectors at $O(n)$ cost; queries that need derivation-attestation invoke witness-chain replay against the persisted (or reconstructed) chain.
- **Federation handshake protocol layering.** A federation handshake exchanges evidence vectors as the cheap mutual binding; deeper trust requires witness exchange. The handshake protocol can negotiate attestation depth per peer pair and per content sensitivity.
- **Replay attestation via canonical-form reproducibility.** Per [recovery-via-event-log-replay-determinism](recovery-via-event-log-replay-determinism.md), a fresh substrate replaying the same event log produces byte-identical state. Replay-then-recompute-evidence on a fresh substrate must yield digit-identical evidence to the original; mismatch is `PCM_EVIDENCE_INVALID`. This is the substrate's structural-determinism conformance test.
- **Conformance vector certification.** A substrate implementation passing the [conformance vectors](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/conformance-vectors.md) and producing matching evidence vectors against the canonical-fixture inputs is conformance-attested at the binding level. Derivation-conformance requires additional witness-chain matching against the conformance fixtures.

## What this rules out

- **Treating evidence-match as derivation-soundness in a federation trust contract.** A peer that ships evidence and the receiver treats the matching evidence as proof-of-derivation is over-trusting. The receiver's contract should explicitly state attestation depth — binding only, or binding plus derivation. The substrate's federation handshake content per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md) parametrises this trust contract.
- **Audit pipelines that omit per-artifact chain checks while presenting evidence-match as full audit.** The evidence vector binds each repair-entry's canonical bytes (which include `before_hash`/`after_hash`), but not the *contiguity* of the per-artifact chain across entries. A full audit additionally invokes [repair-log-hash-chain-as-per-artifact-merkle-projection](repair-log-hash-chain-as-per-artifact-merkle-projection.md)'s validation algorithm against the persisted log. Skipping this misses the chain-break failure mode.
- **Evidence vectors with non-canonical hashing.** A substrate that hashes raw bytes instead of canonical bytes loses injectivity (per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md)) and the binding property degrades — two semantically-equal invocations may produce non-matching evidence. This is non-conformance.
- **Evidence vectors that elide entries.** A substrate that elides repair-log entries from the evidence vector (e.g. omitting "boring" entries it deems uninteresting) breaks the binding contract — a verifier's recomputation would include the elided entries' hashes and fail. The discipline is full-coverage: every repair-log entry in trajectory order contributes its hash to the vector.

## What this requires

- The substrate's canonical-form discipline per [canonical-form](teaching/explanations/canonical-form.md) is deterministic across implementations.
- Hash injectivity holds per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md).
- The substrate emits evidence vectors per the [evidence-vector](teaching/explanations/evidence-vector.md) §1 ordering and shape.
- Settlement is deterministic per [settlement-determinism](settlement-determinism.md), so re-running `respond` on the same canonical inputs produces the same canonical outputs and repair log.

## Position

This theorem grounds the substrate's evidence-vector attestation surface in a structurally honest characterisation. The dev spec's evidence-vector specification commits the substrate to a specific cryptographic binding artefact; the theorem clarifies what attestation strength that artefact provides — binding, not derivation — and how it composes with the substrate's other attestation surface ([witness-chain-as-proof-object](witness-chain-as-proof-object.md)).

The substrate's full-strength attestation contract is the conjunction of these two theorems: evidence vector for cheap binding-attestation, witness chain for full derivation-attestation. A federation peer, audit tool, or replay verifier chooses attestation depth per its trust contract and per its computational budget; the substrate emits both deterministically per the conformance-determinism trilogy ([bootstrap-determinism](bootstrap-determinism.md), [settlement-determinism](settlement-determinism.md), [recovery-via-event-log-replay-determinism](recovery-via-event-log-replay-determinism.md)).

Without this disambiguation, the dev spec's claim "the chain of hashes is the proof" (per [evidence-vector](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/evidence-vector.md) §4) is rhetorically ambiguous between the two attestation surfaces — a substrate implementer or federation-protocol designer reading the dev spec without this distinction may design a trust contract whose actual attestation strength is weaker than its prose suggests. The theorem makes the strength explicit so that the substrate's federation, audit, and replay disciplines rest on the right structural ground.
