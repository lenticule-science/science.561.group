---
type: definition
class: substrate-entity
realizes: [federation]
depends-on: [federation, federation-graph]
see-also: [outpost-record, inbox-record]
title: Federation bridge
description: A federation bridge is the substrate-entity that records how to translate between two predicated computers running different operator-specification versions.
---

# Federation bridge

A **federation bridge** is the substrate-entity that records *how to translate* between two predicated computers running different operator-specification versions.
When a substrate emits a message to a peer running a different version of its closure rules, shapes, or operation catalog, the bridge entity declares the canonical-form translation that makes the message admissible to the recipient.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of what the bridge translates between.
- **`from-version`** — reference to the source operator-specification version (a content-hash of the source substrate's closure-rule-system, shape catalog, etc.).
- **`to-version`** — reference to the destination operator-specification version.
- **`translations`** — a list of translation rules, each declaring how to map source-side predicates and values to destination-side predicates and values.
  Each translation rule is itself a [closure rule](../../teaching/explanations/closure-rule.md) record whose premise matches against source-side content and whose conclusion produces destination-side content.
- **`signed-by`** — reference to the identity that signed the bridge entity.
  Bridges between federated substrates are admissible only when both sides recognize the signing authority; both substrates' [federation graph](../federation-graph/federation-graph.md) entities cite the bridge with this signature.
- **`coverage`** — declarations of what content the bridge translates: which predicates from the source vocabulary are translatable, which are dropped, which produce errors.
  Bridges are typically *partial* — a complete-coverage bridge is rare.
- **`closure-kind`** — `bridge`.

## Invariants

- **Translations are themselves closure rules.** Per [self-representation](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), the bridge's content is substrate-readable; the runtime applies translations through the same closure-rule-application machinery as ordinary content.
- **Signed-by is authoritative.** A bridge whose signature does not match an authority both substrates recognize is rejected at the boundary.
- **Coverage is declared.** Source-side content the bridge does not cover is explicitly recorded as out-of-scope; the bridge does not silently drop content.
  Out-of-scope content arriving at the receiving inbox is rejected with a "missing translation" rejection witness.
- **Reversible if symmetric, but symmetry is not required.** A bridge from version A to version B does not need to imply a bridge from B to A.
  Engineering may produce one-way bridges (typically when version A is being deprecated).

## Operations

- *Apply.* The outpost or inbox uses the bridge's translation rules to convert content between vocabularies during emission or reception.
  Application produces a witness recording the bridge's identity, the source content's hash, the translated content's hash.
- *Audit.* Querying which bridges exist between which versions, which translations a particular bridge covers, what content was translated in a given window are substrate traversals.
- *Retire.* When source or destination versions become unsupported, bridges referencing them retire.
  Retired bridges remain for audit but are not used for new translations.

## Position in the platform

The federation bridge is the substrate-level artifact of *cross-version compatibility*.
Without bridges, federation between substrates is admissible only when both run identical operator specifications — a constraint that breaks every time either substrate advances.
With bridges, federation continues across version evolution; the bridge entity is what records the agreement.

The bridge pattern is what makes the corpus's "the algebra IS the protocol" claim engineering-realistic: yes, the algebra is the protocol, but real engineering needs version translation, and the translation is itself substrate content.
