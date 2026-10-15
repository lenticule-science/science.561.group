---
name: Token occurrence
description: "A specifically located presentation of a token under source revision, exact span, encoding and tokenization context, distinct from its lexical spelling, type, denotation or SignCell hand."
date-created: 2026-10-15
see-also: [frontmatter-presentation, world-indexed-term-sense, documentary-source, l-space]
---

# Token occurrence — situated articulation world

A **token occurrence** identifies *this appearance* of a selected mark or token in one source, not the dictionary spelling or a globally stable concept. Its indispensable coordinates include (i) an actually identified source and immutable revision or content address, (ii) a locator/span over the original encoding, (iii) the exact surface bytes or accepted canonical rendering, and (iv) any parser/tokenization conventions needed to reconstruct the selected boundaries.

For example, the spelling \`author\` in two versions of the same Markdown file can be two distinct **occurrences** even if its characters are identical. They might later be interpreted as the same typed predicate under one vocabulary, or as different senses under different worlds. Neither interpretation rewrites the historical source locations.

A token occurrence is not:
- a lexical **term sense** (which interprets what the spelling denotes in a particular world);
- a SignCell **token-hand** merely because both are named “token” (the existing SignCell hand is a typed data carrier of a Mark under its constructor and normalization laws);
- an admitted **claim** (which needs a typed proposition, context and distinct evidence);
- a **proof path** (which needs a qualified derivation and witness, not just a substring);
- an attested **utterance** or an authorized **illocution** (whose speaker, act and authority are independently established).

A path and line number without immutable content coordinates may drift as a file changes; a byte hash without an exact local span is not an occurrence. A derived tokenizer revision can likewise shift token boundaries, so keep the selected segmentation and its version rather than assuming every English word is one primitive Mark.

**Operational consequence:** preserve the source span when interpreting frontmatter, blogging, documents, messages, contracts and agency reports. Only after source admission may a candidate sense be resolved into a typed predication; provenance must remain available through all resulting claim and evidence views. See [L-Space](l-space.md), the [Language Science marks-to-utterances research](../../../research/marks-utterances-and-contextual-semantics.md), and [original SignCell token carriers](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/apps/signcell/src/utterance.mjs).
