---
type: morphism
class: serialization-operation
realizes: [serialization-format, canonical-form]
depends-on: [serialization-format, canonical-form, predication-valuation, hash-discipline]
see-also: [decode, interfacer-counit-law]
---

# Encode

The substrate operation that serializes a substrate region into a chosen [serialization format](teaching/explanations/serialization-format.md)'s canonical-form bytes. Encode is the writer-half of the substrate's canonicalize-and-hash discipline at the boundary.

## Signature

`encode(region, format) → canonical-bytes`

Inputs:

- **`region`** — references to a substrate region: a predication cell, a sublocale projection, a snapshot, a witness chain.
- **`format`** — reference to the [serialization format](teaching/explanations/serialization-format.md) to use.

Outputs:

- **`canonical-bytes`** — the canonical-form bytes per the cited format's discipline.

## Operational semantics

Encode is a [read-discipline-respecting](cost-discipline-reads-free.md) operation: it produces bytes from the substrate's [predication valuation](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-valuation.md) at the current ordinal without changing substrate state. Per [hash-discipline](teaching/explanations/hash-discipline.md), the canonical-form bytes hash to the substrate's recorded canonical-form hash for the region.

For each format, encode applies the format-specific canonical serialization: sorted-keys JSON, byte-deterministic msgpack, schema-validated protobuf, RFC 8949 canonical CBOR. Per [interfacer-counit-law](../theorems/interfacer-counit-law.md), the resulting bytes are decodable back to the original substrate predications via [decode](decode.md).

## Engineering invariants

- **Byte-deterministic.** Same region, same format → same bytes. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md).
- **Free per cost-discipline.** Encode is a substrate read; per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), no state change.
- **Format-determinate.** The output bytes' shape is determined by the cited format. Different formats produce different bytes from the same substrate content.

## Position in the substrate

Encode is the substrate's *outbound serialization primitive*. Combined with [decode](decode.md), it is what makes substrate content portable across substrate boundaries — for federation, for storage, for external observation. The pattern composes with [interfacer](teaching/explanations/interfacer.md) (which uses encode/decode at its boundary), [send-message](send-message.md) (which encodes content for transmission), and [take-snapshot](take-snapshot.md) (which encodes substrate state for snapshot storage).
