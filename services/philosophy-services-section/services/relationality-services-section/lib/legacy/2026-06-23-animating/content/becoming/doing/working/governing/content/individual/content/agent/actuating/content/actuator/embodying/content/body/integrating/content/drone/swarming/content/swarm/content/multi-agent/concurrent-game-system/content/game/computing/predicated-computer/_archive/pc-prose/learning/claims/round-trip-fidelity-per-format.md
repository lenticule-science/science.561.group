---
type: theorem
class: engineering-claim
status: proved
depends-on: [serialization-format, encode, decode, canonical-form, hash-injectivity-under-canonical-form, interfacer-counit-law]
see-also: [doctrine-fidelity-compositionality]
---

# Encode/decode round-trip is fidelity-preserving per format

**Claim.** For any [serialization format](teaching/explanations/serialization-format.md) $F$ that satisfies the substrate's canonical-form discipline (byte-deterministic, bidirectional, hash-respecting), and any substrate predications $p$ admissible to $F$:

$$\mathrm{decode}(\mathrm{encode}(p, F), F) \;=\; p$$

The round-trip preserves predication identity. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), this is equivalent to: the canonical-form hash of the decoded predications equals the canonical-form hash of the original predications.

## Why this holds

The argument is the substrate-side instance of [interfacer-counit-law](interfacer-counit-law.md) applied to the encode/decode pair as a particular interfacer.

**Part 1: Encode produces canonical bytes.** Per [encode](../morphisms/encode.md), the output bytes are byte-deterministic per the cited format's canonical-form discipline. Same predications, same format → same bytes.

**Part 2: Decode is the inverse on canonical bytes.** Per [decode](../morphisms/decode.md), the format's parser is the deterministic inverse of the canonicalize-and-encode operation on canonical-form bytes.

**Part 3: Predications admissible to the format are exactly those round-trippable.** A format may have a kernel — content the format explicitly does not preserve. Per [doctrine-fidelity-compositionality](doctrine-fidelity-compositionality.md), the kernel must be declared. Predications outside the format's admissible set are not round-trippable through the format; they require either format extension or an alternative format.

Combining: encode produces canonical bytes (Part 1), decode is the deterministic inverse (Part 2), and predications admissible to the format are exactly those not in the format's kernel (Part 3). The round-trip is identity on admissible predications.

## Engineering consequence

The round-trip-fidelity claim is what makes the substrate's serialization layer *trustworthy*. Several engineering uses follow:

- **Cross-substrate federation.** Per [federation-convergence](federation-convergence.md), substrates federating via a chosen format converge on the same predication content. The format's round-trip-fidelity is what ensures the federated content is the same on both sides.
- **Snapshot / backup integrity.** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md) and [backup-restore-fidelity](backup-restore-fidelity.md), restore depends on encode/decode round-trip preserving substrate state.
- **Wire-format interchangeability.** A substrate may serialize the same content in multiple formats (JSON for HTTP APIs, CBOR for binary transports, RDF for semantic-web exchange). All formats produce byte-identical predications on round-trip, so external consumers can choose their preferred format without affecting substrate content identity.

## What the theorem rules out

- A format whose canonical-form is incomplete (locale-sensitive number formatting, time-zone-sensitive timestamps without explicit zones) violates Part 1. The substrate must use only canonical-form-complete formats.
- A format with an undeclared kernel produces silent fidelity gaps. Per [doctrine-fidelity-compositionality](doctrine-fidelity-compositionality.md), the kernel must be explicit.
- A format whose decode is non-deterministic (a parser that may produce different predications from the same bytes depending on ambient state) violates Part 2.

## What the theorem requires

- The format $F$ satisfies the byte-deterministic, bidirectional, hash-respecting commitments per [serialization-format](teaching/explanations/serialization-format.md).
- The predications $p$ are admissible to $F$ (not in $F$'s declared kernel).
- The substrate's [encode](../morphisms/encode.md) and [decode](../morphisms/decode.md) operators conform to the format's canonical discipline.
