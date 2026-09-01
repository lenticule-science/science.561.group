---
type: morphism
class: serialization-operation
realizes: [serialization-format, canonical-form]
depends-on: [serialization-format, canonical-form, predication-valuation, hash-discipline]
see-also: [encode, interfacer-counit-law]
---

# Decode

The substrate operation that parses canonical-form bytes per a chosen [serialization format](teaching/explanations/serialization-format.md) into substrate predications. Decode is the reader-half of the encode/decode pair and is the inverse of [encode](encode.md) on canonical-form bytes.

## Signature

`decode(canonical-bytes, format) → predications | parse-error`

Inputs:

- **`canonical-bytes`** — the bytes to parse.
- **`format`** — the cited [serialization format](teaching/explanations/serialization-format.md).

Outputs:

- **`predications`** — the substrate predications recovered from the bytes.
- **`parse-error`** — when the bytes are not valid canonical-form per the cited format.

## Operational semantics

Decode is the format's parser: per [canonical-form](teaching/explanations/canonical-form.md), each format has a deterministic parse from canonical-form bytes back to substrate predications. Per [interfacer-counit-law](../theorems/interfacer-counit-law.md), `decode(encode(p, f), f) = p` for any format `f` and predications `p` admissible to `f`.

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), decode does not advance substrate state — it produces predications for the caller to admit (typically via [admit](admit.md)). Decoding is structurally a pure parse; the admission-and-settle of the resulting predications is a separate substrate operation.

## Engineering invariants

- **Inverse of encode.** Per [interfacer-counit-law](../theorems/interfacer-counit-law.md), the round-trip is fidelity-preserving on canonical content.
- **Hash-verified.** Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the decoded predications' canonical-form hash equals the input bytes' hash. The substrate may verify this as a tamper-detection check.
- **Format-strict.** The bytes must conform to the cited format's canonical discipline. Pre-canonicalized bytes (raw JSON without sorted keys, etc.) are rejected as parse errors.

## Position in the substrate

Decode is the substrate's *inbound deserialization primitive*. Combined with [encode](encode.md), it makes substrate content portable across substrate boundaries. The pattern composes with [interfacer](teaching/explanations/interfacer.md), [receive-message](receive-message.md) (which decodes incoming bytes), [restore-from-backup](restore-from-backup.md) (which decodes backup bytes), and [admit](admit.md) (which receives the decoded predications for substrate-state advance).
