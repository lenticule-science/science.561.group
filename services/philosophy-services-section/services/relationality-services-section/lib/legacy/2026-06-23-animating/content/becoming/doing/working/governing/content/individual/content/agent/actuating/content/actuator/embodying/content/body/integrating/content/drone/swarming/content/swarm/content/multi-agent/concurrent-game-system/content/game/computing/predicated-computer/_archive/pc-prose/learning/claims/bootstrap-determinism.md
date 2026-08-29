---
type: theorem
class: engineering-claim
status: proved
depends-on: [bootstrap-content, bootstrap, settlement-determinism, settlement-via-closure-2-monad, hash-injectivity-under-canonical-form, canonical-form-via-settling-quiescence, determinism-via-fiber-functoriality]
see-also: [bilattice-operation-table-correctness, closure-rule-wire-format-canonicalization]
---

# Two substrates admitting the same bootstrap content reach byte-identical post-bootstrap state

**Claim.** For two substrates $S_1$ and $S_2$ that admit the same [bootstrap content](teaching/explanations/bootstrap-content.md) sequence — same canonical-JSON of each message, same admission order — the substrates' post-bootstrap states are byte-identical: their settled valuations have the same canonical-form hash, their identity-records hash to the same value (modulo per-substrate keypair generation), and their event logs are the same modulo per-substrate timestamps and ordinals.

This is the substrate-level form of cross-host bootstrap reproducibility: a "fresh substrate" is a deterministic function of its bootstrap content, not of its runtime host.

## Why this holds

Per [settlement-determinism](settlement-determinism.md), the substrate's settled state is a function of `(event log, closure-rule system)`. Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), settlement is the closure 2-monad's iteration to fixed point — deterministic in the seed.

For two substrates $S_1, S_2$ with identical bootstrap content:

**Part 1: Identical bootstrap event logs.** The bootstrap content is admitted in the same order. Per [bootstrap](teaching/explanations/bootstrap.md), each admission appends to the event log; per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the canonical-form of each message is byte-identical. The event logs differ only in:

- Per-substrate event ordinals (the substrate-local sequence number).
- Per-substrate event arrival timestamps (the host's wall-clock at admission).

Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), neither field is part of the message's content hash — both are substrate-local placement metadata. The substrate-content portion of the log is identical.

**Part 2: Identical closure-rule system installation.** The bootstrap content includes the closure-rule system (per [bootstrap-content](teaching/explanations/bootstrap-content.md) step 4). Per [closure-rule-wire-format-canonicalization](closure-rule-wire-format-canonicalization.md), each rule's canonical-form is byte-identical. Per the wire format's canonical structure, both substrates install the same rules with the same hashes.

**Part 3: Identical settlement.** Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the substrate's settled state is the closure 2-monad's iteration on the seed. Both substrates have the same seed (bootstrap content) and the same closure-rule system. Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), the closure operator's iteration is functorial — same input, same output. The settled valuations are byte-identical.

**Part 4: Identical bootstrap-attestation.** Per [bootstrap-content](teaching/explanations/bootstrap-content.md) step 6, the bootstrap-attestation witness includes a hash of all preceding bootstrap content. Both substrates compute the same hash (per Parts 1-2); only the signature differs (per-substrate keys).

The substrates differ only in their per-substrate identity keypairs — which is structurally required, since two distinct substrates must have distinct identities. The substrate-content portion of the post-bootstrap state is byte-identical.

## Engineering consequence

- **Cross-host bootstrap reproducibility.** A bootstrap content sequence distributed to multiple hosts produces functionally-identical substrates (modulo identity). The substrate's audit, federation, and conformance properties hold across hosts from the moment of operational readiness.
- **Bootstrap content is itself testable.** A conformance test can compare two implementations' post-bootstrap state on the same bootstrap content; per the theorem, conformance requires byte-identical state (modulo identity).
- **Deployment from bootstrap manifest.** The bootstrap content can be distributed as a manifest (a sequence of canonical-JSON messages); fresh deployments admit the manifest and reach a known operational state.
- **Bootstrap diff is meaningful.** Two substrates with different bootstrap manifests have structurally different post-bootstrap state. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the difference is detectable by comparing canonical-form hashes of the substrate states.
- **Federation handshake can verify bootstrap compatibility.** Per [federation-envelope](teaching/explanations/federation-envelope.md), federation handshake includes substrate-id and value-domain attestation. Per the theorem, two substrates with matching bootstrap content (including value-domain) are bootstrap-compatible — federation can proceed without further compatibility checks.

## What the theorem rules out

- **Bootstrap with hidden runtime state.** A substrate whose bootstrap reads runtime state (host time, environment variables, host identity beyond the chosen identity-record) introduces non-determinism into the bootstrap. Per [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), this breaks the bootstrap's reproducibility.
- **Bootstrap with implicit ordering.** A bootstrap that admits content in an order determined by host-side scheduling (e.g., file-system iteration order) produces non-deterministic post-bootstrap state. The substrate's discipline is explicit ordering.
- **Bootstrap with non-canonical content.** A bootstrap message in non-canonical-JSON form has a different hash, hence a different identity. Per [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md), the substrate's discipline is canonical-form throughout.
- **Bootstrap that depends on prior substrate state.** A "fresh" substrate that inherits state from a prior incarnation (a leftover database, a residual filesystem) is not really fresh — its post-bootstrap state depends on the residual. The substrate's discipline is to refuse to admit bootstrap content into a non-empty substrate.

## What the theorem requires

- The bootstrap content is in canonical-JSON form per [canonical-form-via-settling-quiescence](canonical-form-via-settling-quiescence.md).
- The bootstrap admission order is explicit (not host-dependent).
- The substrate's runtime is conformant on the value-domain (per [bilattice-operation-table-correctness](bilattice-operation-table-correctness.md)) and on the rule wire-format (per [closure-rule-wire-format-canonicalization](closure-rule-wire-format-canonicalization.md)).
- The substrate is genuinely fresh — no prior content present at bootstrap start.
- Per-substrate identity keypairs are generated independently (no shared keys across substrates).

## Position

This theorem grounds the substrate's bootstrap discipline in the predication-categories' settlement-determinism framework. Together with [bilattice-operation-table-correctness](bilattice-operation-table-correctness.md), [closure-rule-wire-format-canonicalization](closure-rule-wire-format-canonicalization.md), and [conformance-via-fiber-algebra-functor](conformance-via-fiber-algebra-functor.md), it gives the substrate's *operational-readiness chain*: the value-domain is fixed, the rule format is fixed, the bootstrap content is fixed, the post-bootstrap state is determined. An implementer building a fresh substrate against a bootstrap manifest has structural guarantees about what the resulting substrate will be.

The substrate's claim to *cross-host reproducibility* is structural — not a deployment best-practice but a theorem about the substrate's bootstrap discipline composed with its determinism guarantees.
