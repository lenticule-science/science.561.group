---
type: concept
class: form-discipline
depends-on: [form, federation-envelope, message-data-model, validation-rule, doctrine-fidelity, hash-discipline, signature]
see-also: [form-submission-doctrine-fidelity, message-as-federation-envelope-payload]
---

# Form-submission envelope

The substrate's *canonical wrapper for a [form](form.md) submission* — the predication structure that carries a user's filled-in form fields from the form's UI through validation, optionally across substrate boundaries via [federation-envelope](../../teaching/explanations/federation-envelope.md), and into the receiving substrate's vocabulary as a typed predication.

In the substrate's hyperdoctrine setting, a form-submission envelope is *the substrate-side reification of a form's filled-in state at submission time*. Per [form-submission-doctrine-fidelity](../theorems/form-submission-doctrine-fidelity.md), the submission preserves the form's structural shape — the receiver sees the submission as a typed predication, not as raw text needing parsing.

## Why this concept exists

[form](form.md) describes what a form is at the entity level. [federation-envelope](../../teaching/explanations/federation-envelope.md) describes how messages cross substrates. But the *bridge* — how a form submission becomes substrate content, what its predication shape is, how the form's structural typing is preserved across federation — is not specified. This concept fills that gap, enabling the substrate's win on cross-user structured requests.

## Submission-envelope structure

When a user submits a form, the substrate produces a submission-envelope:

```json
{
  "kind": "form-submission",
  "submission-id": "<canonical hash of remaining content>",
  "form-id": "<the form-record-hash>",
  "form-version": "<the form's version-hash at submission time>",
  "submitter": {
    "account-hash": "<the submitting account>",
    "session-hash": "<the session that authenticated the submission>"
  },
  "submitted-at-ordinal": <substrate ordinal>,
  "submitted-at-declared-time": "<ISO 8601 UTC>",
  "fields": {
    "<field-name-1>": <field-value-1>,
    "<field-name-2>": <field-value-2>,
    ...
  },
  "validation-state": {
    "all-valid": true,
    "per-field": {"<field-name>": "<valid|invalid:reason>", ...}
  },
  "signature": {
    "scheme": "Ed25519",
    "signing-key-hash": "<submitter's signing key>",
    "value": "<base64 signature>"
  }
}
```

Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the submission-id is the canonical-form hash; per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the signature binds the submission to the submitter.

## Field encoding

Each form field's value is encoded according to the form's declared field type:

- **Text field** — UTF-8 string.
- **Number field** — JSON number (canonical decimal representation).
- **Date field** — ISO 8601 UTC.
- **Boolean field** — JSON `true` / `false`.
- **Choice field** — the chosen option's canonical string identifier.
- **Multi-choice field** — sorted list of chosen identifiers.
- **Entity-reference field** — the referenced entity's canonical hash.
- **File-attachment field** — the attached file's canonical hash; per [encryption-as-visibility-restriction-via-invisible-automorphism](../../../theorems/encryption-as-visibility-restriction-via-invisible-automorphism.md), files may be encrypted under recipient identity-keys.
- **Structured-payload field** — canonical-JSON of substrate predications (for nested-form scenarios).

The form-id field references the [form](form.md) entity that defines the schema; the submission's field structure must conform.

## Validation

Per [validation-rule](validation-rule.md), each form field has zero or more validation rules. The substrate runs validation:

- *Client-side*: as the user types, the substrate's renderer (per [rendering-discipline](rendering-discipline.md)) evaluates validation rules and surfaces errors immediately.
- *Server-side*: at submission time, the substrate re-validates server-side; client-side validation is UX-only, server-side is authoritative.

The submission-envelope's `validation-state` field records the result. Per the substrate's discipline, submissions with `all-valid: false` are recorded but not dispatched downstream — the user must correct errors before submission completes.

## Translation to typed predication

The form's defining entity declares the *output predication shape* — what predication kind a successful submission becomes. For example, a `print-widget-request-form` declares output:

```json
{
  "output-kind": "print-widget-request",
  "field-mapping": {
    "widget-spec": "spec",
    "quantity": "quantity",
    "due-by": "due-by",
    "material": "material"
  }
}
```

On successful submission, the substrate runs a closure rule that admits a `print-widget-request` cell with fields populated from the form-submission's fields per the mapping. The original form-submission cell is preserved (audit), the typed predication is what downstream operations consume.

Per [form-submission-doctrine-fidelity](../theorems/form-submission-doctrine-fidelity.md), the translation is faithful — the submission's structure determines the typed predication's structure.

## Federation: cross-substrate form submissions

When a form is hosted on substrate $A$ and the user is on substrate $B$ (e.g., a contractor's form for a print-widget-request submitted by a customer):

1. User on substrate $B$ fetches the form from substrate $A$ (via federation read).
2. User fills the form in their substrate-$B$ UI.
3. On submit, substrate $B$ creates a form-submission envelope.
4. The envelope is wrapped in a [federation-envelope](../../teaching/explanations/federation-envelope.md) with `payload.kind: "form-submission-delivery"` and `payload.content` = the form-submission envelope.
5. Federation envelope is signed by substrate $B$'s identity-key (federation-level) plus the submitter's identity-key (submission-level).
6. Envelope crosses to substrate $A$.
7. Substrate $A$ verifies federation-level signature, accessibility per [trust-boundary-modal-validity](../../../theorems/trust-boundary-modal-validity.md), then verifies submission-level signature.
8. Substrate $A$ admits the form-submission cell.
9. Closure rule fires — admit the typed predication (`print-widget-request`).
10. Per [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md), the typed predication is now in substrate $A$'s vocabulary, ready for dispatch.

Per [form-submission-doctrine-fidelity](../theorems/form-submission-doctrine-fidelity.md), the receiver sees the same structural shape the submitter saw — federation didn't transform the submission into raw text or generic JSON.

## Why this is the substrate's win

In SaaS-world, a "request to print a widget" arriving via email is a text blob that requires manual parsing or NLP. Even structured submissions (Google Forms, Typeform) produce results in a foreign system that the receiver's app doesn't natively understand.

In substrate-world, the form-submission envelope crosses federation as substrate predications. The receiver's substrate vocabulary already understands `print-widget-request` (via shared-vocabulary federation per the pattern); the typed predication slots directly into the receiver's closure-rule machinery; dispatch happens immediately.

The substrate's structural advantage: cross-user typed requests are a first-class operation, not an after-the-fact integration project.

## Position

The form-submission envelope is the substrate's *typed-cross-substrate-request primitive*. Per [form](form.md), the form defines the schema; per [form-submission-envelope](form-submission-envelope.md), the submission canonicalizes the filled state; per [federation-envelope](../../teaching/explanations/federation-envelope.md), the submission crosses substrates; per [form-submission-doctrine-fidelity](../theorems/form-submission-doctrine-fidelity.md), the structure is preserved end-to-end.

The concept composes with [form](form.md), [validation-rule](validation-rule.md), [federation-envelope](../../teaching/explanations/federation-envelope.md), [message-data-model](message-data-model.md) (a form-submission can be the body of a structured message), and [graded-dispatch-via-q-enriched-fusion](../../../theorems/graded-dispatch-via-q-enriched-fusion.md) (the typed predication a form-submission produces is dispatch-ready).
