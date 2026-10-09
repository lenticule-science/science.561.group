---
type: concept
class: wire-format
depends-on: [canonical-form, hash-discipline, interfacer]
see-also: [encoding-discipline, doctrine-fidelity]
---

# Serialization format

A *byte-level encoding* of substrate content for transmission, persistence, or external interpretation. The substrate's [canonical-form](canonical-form.md) is the discipline; a serialization format is a particular realization of that discipline (JSON-LD, msgpack, protobuf, custom binary, etc.).

A serialization format has three structural commitments to qualify as substrate-compatible:

- **Byte-deterministic.** Per [canonical-form](canonical-form.md), the same content must produce the same bytes regardless of in-memory representation, host, or implementation. Formats with implementation-defined ordering (JSON without sorted keys, YAML without canonical scalars) are not directly substrate-compatible without an additional canonicalization layer.
- **Bidirectional.** Per [interfacer-counit-law](../theorems/interfacer-counit-law.md), the format's encode/decode pair must round-trip the substrate predications: encode-then-decode produces the original predications. Lossy formats are admissible only when their kernel (the content they explicitly do not preserve) is declared.
- **Hash-respecting.** Per [hash-discipline](hash-discipline.md), two byte-identical encodings must produce the same hash. Formats that introduce variable framing (different compressions, optional metadata) must canonicalize before hashing.

Common serialization formats and their substrate-suitability:

- **JSON (canonical form, sorted keys, no whitespace)** — Universal, widely tooled. Suitable for substrate use when a canonical-form variant is enforced.
- **JSON-LD** — JSON with semantic-web vocabulary linking. Suitable for substrate use; the LD context is itself substrate content.
- **msgpack** — Binary, compact, deterministic. Suitable for substrate use without modification.
- **protobuf** — Schema-typed binary. Suitable for substrate use when the schema is also substrate content.
- **CBOR (canonical, RFC 8949 §4.2.1)** — Binary, deterministic, IETF-standard for canonical encoding. Suitable for substrate use.
- **RDF (Turtle, N-Triples, JSON-LD)** — Semantic-web triple-store formats. Suitable for substrate use; per the substrate's predication-cell model, RDF triples have natural correspondence with substrate cells.
- **Custom substrate-binary** — Format designed for the substrate, with its own canonical-form and hash discipline. Suitable when external interoperability is not required.

The substrate's choice of serialization format is typically declared per [federation-bridge](../objects/federation-bridge.md) (cross-substrate translation) and per [transport-record](../objects/transport-record.md) (per-transport wire format). Per [transport-tolerance-of-federation](../theorems/transport-tolerance-of-federation.md), substrate-level federation-convergence holds across format choices, modulo the format-translation being doctrine-fidel per [doctrine-fidelity-compositionality](../theorems/doctrine-fidelity-compositionality.md).
