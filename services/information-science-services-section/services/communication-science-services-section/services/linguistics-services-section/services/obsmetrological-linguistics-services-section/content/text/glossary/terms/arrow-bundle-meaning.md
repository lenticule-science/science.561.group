---
title: "Arrow-bundle meaning"
date-created: 2026-08-21
type: term
aliases:
  - "arrow-bundle meaning"
  - "Yoneda meaning"
keywords:
  - obsmetrological-linguistics
  - witnessed-field
  - axiom
  - category-theory
status: research-grade
description: "Axiom A3: a linguistic item is the totality of its witnessed morphisms (uses, uptakes, repairs, substitutions, translations, refusals); meaning is the presheaf of witnessed use. The category-theoretic Yoneda lemma is taken as foundational rather than as an illustrative analogy."
defines:
  - "Arrow-bundle meaning"
authors:
  - Claude Opus
---

Arrow-bundle meaning is the Witnessed Field theory's account of what a
linguistic item *is*: not a form with an attached meaning, but the totality
of its witnessed morphisms — its uses, uptakes, repairs, substitutions,
translations, and refusals — and fully recoverable from them. This is the
category-theoretic Yoneda lemma (an object is determined by its bundle of
incoming arrows) applied to language and treated as foundational rather than
as a suggestive metaphor: the estate's own Lean formalization
(`Obsmetrologia/Language/Predicating/YonedaArrowsFirst.lean`, theorem
`object_is_its_morphisms`) is cited as the object-level proof this rests on,
with `pymetrologic/yoneda.py` as its executable shadow.

The consequence for meaning is direct: meaning is the presheaf of witnessed
use, not a fact stored in a dictionary entry and merely illustrated by usage.
A word's dictionary sense is a compressed readout of its arrow-bundle, in the
same way a [grammar is a gauge-fixed chart](./grammar-as-gauge.md) on the
larger field.

## The projection lemma

An informal corollary, stated in the source note as "the projection lemma":
a distributional embedding (the kind a large language model learns) is the
provenance-forgetting projection of this presheaf. It keeps the shape of the
arrow-bundle — which items co-occur with which, statistically — while
discarding who witnessed each arrow, under what consent, and with what
authority. This is offered in the source note as a candidate explanation for
why such models exhibit meaning-shaped behavior while lacking accountable
authority over what they produce; the source note frames it as informal and
does not claim a completed proof. The general operation of transporting
content while forgetting witnesses is the subject of the [extraction
theorem](./extraction-theorem.md).

## Status

The Lean citation proves a fact about a formal object (an object is its
bundle of morphisms in the given category); the claim that natural-language
items behave this way, and the projection-lemma reading of distributional
embeddings, are empirical and interpretive hypotheses respectively — both
Research-grade, per the source note's own discipline.

## Related terms

- [Witnessed utterance-event](./witnessed-utterance-event.md) — the events
  whose morphisms compose the arrow-bundle
- [Commuting-cone mastery](./commuting-cone-mastery.md) — how a learner's
  partial arrow-bundle is measured against full mastery
- [Extraction theorem](./extraction-theorem.md) — the general witness-forgetting
  operation the projection lemma is one instance of

**Source:** Axiom A3, [Language as Witnessed Field: Working Theory
Note](../../../../../../content/text/documents/articles/notes/2026-08-20-language-as-witnessed-field-working-theory.md).
