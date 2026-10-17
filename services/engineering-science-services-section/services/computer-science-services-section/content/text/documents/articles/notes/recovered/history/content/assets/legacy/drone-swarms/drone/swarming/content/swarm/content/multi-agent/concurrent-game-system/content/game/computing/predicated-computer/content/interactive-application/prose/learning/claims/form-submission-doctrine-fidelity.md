---
type: theorem
class: engineering-claim
status: proved
depends-on: [form-submission-envelope, form, federation-envelope, doctrine-fidelity, doctrine-fidelity-via-faithful-interfacer-functor, hash-injectivity-under-canonical-form, signature-binds-witness-to-identity]
see-also: [authentication-as-modal-restriction, message-as-federation-envelope-payload]
---

# Form submissions preserve structural shape across federation

**Claim.** For any [form-submission-envelope](teaching/explanations/form-submission-envelope.md) crossing a federation boundary via [federation-envelope](../../teaching/explanations/federation-envelope.md):

1. **Submission structure preserved.** The receiver's substrate sees the submission's field structure (per the form's schema) — the field names, types, and values are byte-identical to what the submitter's substrate emitted.
2. **Typed-predication translation preserved.** The closure rule that translates the submission into the typed predication produces the same typed predication in the receiver's substrate as it would in the submitter's substrate, given the same form-version and field-mapping.
3. **Audit chain preserved.** The submitter's signature on the submission, plus the federation envelope's signature, plus the receiver's admission witness compose to a verifiable chain — an auditor can trace the submission from composition to dispatch.

The form-submission envelope is therefore a *faithful federation primitive* in the sense of [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md): the cross-substrate transit is a faithful interfacer functor.

## Why this holds

The argument composes three structural properties.

**Part 1: Submission structure is canonical-form-preserved.** Per [form-submission-envelope](teaching/explanations/form-submission-envelope.md), the submission is canonical-JSON; per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), distinct submissions have distinct canonical hashes, and identical submissions have identical canonical-bytes. The federation envelope wraps the submission's canonical-JSON as `payload.content`; per [federation-envelope](../../teaching/explanations/federation-envelope.md), the envelope's `payload.content-hash` is the submission's hash. Any modification of the submission's bytes during transit invalidates the content-hash and the federation signature.

The receiver, on admitting the envelope, recomputes the submission's hash from `payload.content` and verifies it matches `payload.content-hash`. Hash equality means byte equality means structural equality. The receiver's submission has the same field names, types, and values as the submitter's.

**Part 2: Translation is determined by form-version + field-mapping.** Per [form-submission-envelope](teaching/explanations/form-submission-envelope.md), the form's defining entity declares the output predication shape and field mapping. The closure rule that runs on submission-receipt reads:

- The form-id (which form defines the schema).
- The form-version (which version the submitter used — per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the version-hash uniquely determines the schema).
- The submission's fields.

Per [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md), the closure rule is a fibration functor — same input, same output. Both the submitter's substrate and the receiver's substrate, given the same form-version and field-mapping, produce the same typed predication.

**Part 3: Signatures form a verifiable chain.** Per [form-submission-envelope](teaching/explanations/form-submission-envelope.md), the submission carries the submitter's signature. Per [federation-envelope](../../teaching/explanations/federation-envelope.md), the federation wrap carries the substrate-level signature. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), each signature uniquely binds its content to its signer's identity-key.

An auditor traces:
1. The submitter signed the submission with their identity-key.
2. The submitter's substrate signed the federation envelope with the substrate's identity-key.
3. The federation envelope crossed to the receiver.
4. The receiver verified both signatures, recorded the admission as a witness signed by the receiver's substrate.

The chain is structurally verifiable end-to-end: the submission was composed by the submitter, transmitted by their substrate, received by the receiver's substrate.

## Engineering consequence

- **Cross-substrate forms are first-class.** A form hosted on substrate $A$ submitted by a user on substrate $B$ produces a typed predication on substrate $A$ identical (in structure) to what the same submission would produce on substrate $A$ alone. No translation losses, no per-federation-pair adapter code.
- **Typed dispatch works across substrates.** Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), dispatch operates on typed predications. Per the theorem, cross-substrate form submissions produce dispatch-ready typed predications without intermediate translation.
- **Form-version compatibility is structural.** Two substrates running the same form-version produce identical translations. Per the theorem, the receiver's substrate must have the same form-version (or compatible) admitted; per [shared-vocabulary-federation](teaching/explanations/shared-vocabulary-federation.md), this is the substrate's discipline for vocabulary-aware federation.
- **Form spoofing is structurally detected.** A submission whose claimed form-version doesn't match its actual structure produces a translation mismatch the receiver detects — per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), the mismatch surfaces as a $\top$-cell.
- **Audit replays the submission deterministically.** Per [witness-chain-as-proof-object](../../../theorems/witness-chain-as-proof-object.md), the witness chain is the substrate's proof object. An auditor can replay the submission's federation transit and verify the receiver's admission was correct.

## What the theorem rules out

- **Non-canonical submissions.** A submission whose JSON encoding is non-canonical (different field ordering, non-standard escapes) has a different hash; the federation envelope's content-hash check fails. The substrate refuses such submissions.
- **Tampering during transit.** Per the federation envelope's signature and content-hash, any modification of the submission during transit is detectable. The receiver's admission discipline rejects tampered submissions.
- **Cross-form-version spoofing.** A submission claiming form-version $v_1$ but with structure matching form-version $v_2$ produces a translation mismatch — the receiver's closure rule applies the $v_1$ schema to the $v_2$ structure, fails validation. The substrate refuses.
- **Federation-bridge-induced lossy translation.** A federation bridge that doesn't respect the form-submission envelope's structure (e.g., flattens nested fields, drops empty fields) is non-faithful per [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md). The substrate's discipline is bridge-faithfulness; non-faithful bridges are non-conformant.

## What the theorem requires

- The form-submission envelope is in canonical-form per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md).
- The federation envelope wraps the submission per [federation-envelope](../../teaching/explanations/federation-envelope.md), with content-hash and signatures.
- The submitter and receiver share the form-version (or a compatible bridge exists).
- The receiver's closure rule for submission-translation is conformant per [conformance-via-fiber-algebra-functor](../../../theorems/conformance-via-fiber-algebra-functor.md).

## Position

This theorem is the structural basis for the substrate's *cross-substrate typed-request* discipline. Per [form-submission-envelope](teaching/explanations/form-submission-envelope.md), a form submission becomes substrate content; per the theorem, the content's structure is preserved across federation; per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), the resulting typed predication is dispatch-ready.

Together with [authentication-as-modal-restriction](authentication-as-modal-restriction.md) (the submitter's session-bound capability) and [message-as-federation-envelope-payload](message-as-federation-envelope-payload.md) (messages cross federation), the substrate's user-flow disciplines now have the structural support for end-to-end typed transactions across substrates without integration-shim code.
