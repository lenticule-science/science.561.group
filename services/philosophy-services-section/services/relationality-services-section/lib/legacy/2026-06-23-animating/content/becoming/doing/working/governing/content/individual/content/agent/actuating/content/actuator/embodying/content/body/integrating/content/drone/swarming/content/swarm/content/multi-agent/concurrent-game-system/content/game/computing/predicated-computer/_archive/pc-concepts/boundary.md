---
type: concept
class: structure
depends-on: [scope, witness]
see-also: [provenance, replication]
---

# Boundary

A **boundary** is a substrate entity that records *where the substrate ends and the outside world begins* — the points at which content enters the predicated computer from outside or leaves it for outside, and the discipline under which those crossings are admissible. A predicated computer with no declared boundaries is a closed system; a predicated computer that interacts with humans, external services, or other systems has boundaries, and the substrate's behavior at those boundaries is engineering content.

Three things a boundary declares:

- **Admissibility.** What content is admissible to cross the boundary in each direction. An inbound boundary may require the incoming content to carry certain predicates, satisfy certain shapes, or arrive with a particular signed witness; an outbound boundary may admit only content that carries declared egress predicates. The admissibility rule is recorded as predications on the boundary entity.
- **Authentication and trust.** What identity is required of the external counterparty, what signatures must be present on incoming content, what trust-level the substrate extends to content arriving from this counterparty. Trust is itself substrate content (predications about the counterparty's identity and trust-level), per [self-representation](self-representation.md).
- **Translation.** What canonical-form translation, if any, applies at the boundary — converting between the substrate's internal predicate vocabulary and the external party's vocabulary. Translation rules are themselves substrate entities (closure rules that map source predicates to target predicates); they are versioned, signed, and queryable.

Four engineering uses:

- **Inbound boundary** (the *inbox* in the agential subtheory). Where external messages arrive and are recorded as substrate events. Every inbound message produces a [witness](witness.md) entry recording the message's content, its signature, its admissibility check, and its disposition; the message itself becomes a substrate predication once admitted.
- **Outbound boundary** (the *outpost* in the agential subtheory). Where the substrate emits content to external parties. Every outbound emission produces a witness recording the emitted content, the recipient's identity, the signature applied, and the transmission status. The emitted content is content-addressed via canonical-form hash, so the recipient can verify what was sent.
- **Migration and federation boundary.** When two predicated computers federate, each becomes the other's external party; the boundary discipline applies symmetrically. Inbound from one is outbound from the other, with witnesses on both sides.
- **Read-only-source boundary.** A particular kind of inbound-only boundary where the substrate ingests external content without ever writing back to the source. The substrate derives [exogenous predications](endogenous-and-exogenous-predications.md) from the source — observations about the source's content, position, structure — but the source itself remains unmodified. Common cases: a Git repository whose files the substrate reads to build a relational graph; an external API whose responses the substrate caches; a document corpus the substrate indexes. The substrate's discipline is that re-ingesting from a read-only source at the same source-state produces the same exogenous predications (per [determinism](determinism.md)) and that the substrate's writes never propagate to the source.

A boundary is *not* a network configuration or a protocol decision. It is a substrate entity with predications declaring its admissibility, trust, and translation rules. The runtime's job is to honor the boundary's declarations; the engineering content of the boundary is what the substrate records about it.

The discipline is what makes external-system interaction *auditable in the same way as internal substrate operations*. Every crossing is a witness; every witness is in the event log; the substrate sees its own boundary behavior as data, queryable and replayable through the substrate's operators.
