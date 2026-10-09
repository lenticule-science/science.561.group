---
name: "Linked Data Event Streams"
description: "Linked Data Event Streams (LDES) is a SEMIC technical specification, not a W3C or IETF standard (Flanders contributes the separate open-source OpenLDES tooling that implements it, not the specification itself), that models a dataset as an append-only collection of immutable linked-data members, giving this section's correction-propagation substrate a replayable event-log pattern at a lighter standards-guarantee tier than the RFC- or W3C-Recommendation-tier protocols it would sit alongside."
aliases:
  - "LDES"
  - "Linked Data Event Streams"
date-created: 2026-08-22
instance-of: data-structure
---

Linked Data Event Streams (LDES) is a specification maintained by SEMIC — the European Commission's Semantic Interoperability Community, under the Interoperable Europe programme — at [github.com/SEMICeu/LinkedDataEventStreams](https://github.com/SEMICeu/LinkedDataEventStreams), with the rendered specification at [semiceu.github.io/LinkedDataEventStreams](https://semiceu.github.io/LinkedDataEventStreams/) and a program overview at the [Interoperable Europe Portal](https://interoperable-europe.ec.europa.eu/collection/semic-support-centre/linked-data-event-streams-ldes).
The specification is SEMIC's; Flanders's role is downstream of it, not authorship of it — Digital Flanders's VSDS (Vlaamse Smart Data Space) project built the separate open-source OpenLDES tooling (an LDES Client and LDES Server) that implements this spec, and that distinction should not be blurred.

Its content model is an append-only collection of immutable members, each a linked-data representation of one version of a resource, so that a consumer can replicate and synchronize a full dataset by consuming the stream from any point rather than re-fetching a mutable current state.
That structure is what this section's engineering study needs from it: it is the event-log pattern a claim-state lifecycle (see the program's bet one) would need to be replayed from.

Its actual standards status, reported without inflation: LDES has a released 1.0.0 version and an open-source reference implementation (OpenLDES), but it is a government-consortium specification, not a W3C Recommendation, W3C Note, or IETF RFC — it has not gone through either body's standards process, and any component built on it inherits a lighter-weight standards guarantee than [WebSub](./websub.md), [ActivityPub](./activitypub.md), or the [Memento](./memento-protocol.md) protocol carry.

See [Study of Syndication and Propagation Protocols](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-syndication-and-propagation-protocols.md), section 3.
