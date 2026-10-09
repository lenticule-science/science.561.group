---
name: content-hash-addressing
description: "FARS's commitment that every substrate entity is addressable by the canonical-form SHA-256 of its predications."
type: concept
class: substrate-discipline
instantiates: [hash-discipline]
depends-on: [flatfile, frontmatter-as-presentation, hash-discipline, canonical-form, hash-injectivity-under-canonical-form]
see-also: [sovereign-node, algebra-as-protocol, federation-envelope-record, witness]
title: content-hash-addressing
---

# Content-hash addressing

FARS's commitment that *every substrate entity is addressable by the canonical-form SHA-256 of its predications*.
The path on disk is the entity's *human-readable* address (per [flatfile](../flatfile.md)); the canonical content hash is the entity's *substrate-portable* address — the address an auditor, a federation peer, or a replay engine cites when they need to refer to the entity independently of where it lives in any particular substrate's directory tree.

Content-hash addressing is the FARS-specific instance of the parent-theory [hash-discipline](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-discipline.md).
It pins down what canonicalization a flatfile-substrate realization performs before hashing — without that pinning, two FARS realizations would produce different hashes for byte-equivalent presentation content and federation between them would fail at admission.

## Canonicalization for frontmatter-markdown

Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), hash injectivity requires a single canonical-form per piece of substrate content.
FARS commits to the following canonicalization for `.md` entities:

1. **Parse.** Read the file's bytes; split into frontmatter and body via the realization's `load`-equivalent parser (per [`load`](../morphisms/load.md)).
2. **Interpret.** Run [`interpret`](../../code/transformers/interpret.md) over the parsed [`Note`](../objects/note.md) to produce a [`Fiber`](../../code/structures/fiber.md) — the algebraic projection of the entity's predications.
3. **Canonicalize the fiber.** Sort the fiber's `cells` mapping by the predicate's canonical key (lexicographic on the structured cell-key form); within each cell, normalize the value-domain value to its canonical representative (`⊥`/`t`/`f`/`⊤` as defined in the [substrate value-domain](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md)); strip provenance (provenance is per-realization metadata, not substrate content).
4. **Serialize.** Emit the canonicalized fiber as canonical-JSON: keys lexicographically sorted, no insignificant whitespace, UTF-8 NFC normalization on string values.
5. **Hash.** SHA-256 over the canonical-JSON bytes.

The result is the entity's *content-hash address*: a 32-byte value (typically rendered hex) that two conformant FARS realizations SHALL produce identically for byte-equivalent presentation content.
Two entities with the same content-hash address are *the same entity* in the substrate's federation discipline, regardless of which directory tree position they occupy in either realization.

## What addressing covers

Content-hash addressing applies to every substrate entity that flows across a federation boundary:

- **Notes-as-fibers.** The hash of an entity's interpreted fiber.
  The path on disk is presentation; the hash is the substrate-portable identity.
- **Witnesses.** Per [`Witness`](../objects/witness.md)'s hash-cited discipline, every witness is identified by its own canonical hash.
  Witnesses cite other content (input fibers, output fibers, layer-internal hashes) by *their* canonical hashes.
- **Events.** Per [`Event`](../objects/event.md)'s discipline, every event has a canonical hash.
  The event log's append-only ordering is by append-time; the event's *identity* is its hash.
- **Closure-rule systems.** A rule system's `rule_system_version` cited in witnesses (per [`settle`](../../code/transformers/settle.md)) is the canonical hash of the rule system's bundled definition.
- **Federation envelopes.** Per [federation-envelope-record](../objects/federation-envelope-record.md), the envelope's identity on the wire is its canonical hash.

## Why path-addressing is insufficient at the federation boundary

A path on disk is meaningful inside one substrate's filesystem layout.
Two FARS realizations may legitimately store the same entity at different paths: a centralized realization may flatten everything under `entities/<slug>.md`; a deeply-typed realization may live under `concepts/four-bilattice.md`.
Federation by path-equivalence would refuse to merge content that is structurally identical but stored differently.

Content-hash addressing collapses this artifact: the receiver's `admit-federation-envelope` looks up incoming content by hash; if the hash is one the receiver already has, the content is dedup'd at admission and not re-merged.
If the hash is novel, the receiver settles the content into its own substrate at whatever path its layout convention prescribes.

## What the discipline rules out

- **By-name federation matching.** Matching entities by their slug or filename is fragile — two substrates may use the same slug for entities with different content, or different slugs for the same content.
  Per [hash-injectivity-under-canonical-form](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md), substrate matching is by content, not by name.
- **Mutating an entity in place without changing its address.** Editing a file's frontmatter changes its canonical hash; the new entity is a *different entity* under content addressing.
  Federation peers track both: the old hash (still valid as a historical reference) and the new hash (the current state).
  The substrate's edit log per [event-sourcing](event-sourcing.md) carries the linkage.
- **Realizations that hash the file's bytes directly.** The canonical hash is over the *interpreted, canonicalized fiber*, not over the file's source bytes.
  Two files with identical predications but different whitespace, key-order, or YAML quoting style SHALL produce the same hash; a byte-hash would not.
- **Realizations that include provenance in the hash.** Provenance (which note produced which cell, which file's mtime was current at the read) is per-realization metadata; including it in the hash would make federation between independently-running realizations impossible.

## Position

Content-hash addressing is the substrate-portable identity layer FARS lays over the [flatfile](../flatfile.md) substrate.
Path-addressing remains the *human-and-tooling* address (the address you see in your editor, in URLs, in `cd` commands); content-hash addressing is the *substrate-and-federation* address (the address that survives crossing realization boundaries).
Both are admissible; the discipline pins down when each applies.

The concept is a precondition for [sovereign-node](../../architecture/sovereign-node/sovereign-node.md) (a sovereign node addresses its own state by content), for [algebra-as-protocol](../../algebra-as-protocol/algebra-as-protocol.md) (federation messages cite operands by content hash), and for [federation-envelope-record](../objects/federation-envelope-record.md) (the envelope's `payload.content-hash` is computed per this discipline).
It composes with [witness](../objects/witness.md) (witnesses cite content by hash) and with [event-sourcing](event-sourcing.md) (events are identified by their canonical hash within the log).
