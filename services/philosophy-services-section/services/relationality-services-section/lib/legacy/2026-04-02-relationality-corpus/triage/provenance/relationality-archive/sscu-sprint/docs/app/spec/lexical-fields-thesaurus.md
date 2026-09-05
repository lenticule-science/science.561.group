---
name: lexical-fields-thesaurus
keywords:
  - idea
  - linguistics
  - semantics
part-of: relational-computer
description: "Represents semantic fields and lexical neighborhoods to understand vocabulary and its gaps."
---

Represent semantic fields and lexical neighborhoods to understand your
vocabulary and its gaps.

## 1. Core recognitions

- `SemanticFieldRecognition`
  - a set of lexemes that inhabit a conceptual space (emotion words, motion
    verbs, moral vocabulary, etc.).

- `LexemeRecognition`
  - canonical lexical items with links to senses, morphology, metaphors.

- `LexicalNeighborhoodRecognition`
  - local neighborhoods of lexemes (synonymy, antonymy, relatedness).

## 2. Measurement and topology

- Topology:
  - graphs of semantic fields and their overlaps,
  - how fields map across languages (ties to language-learning idea).

- Measurement:
  - which fields you use heavily vs rarely,
  - where you lack words for recurrent experiences (thin fields).

## 3. Runbooks and uses

- `map_semantic_fields(corpus_slice)`,
- `identify_lexical_gaps(subject_slice)`,
- `help_agent_expand_vocabulary(target_field)`.

This supports richer writing, translation, and reflection on how you name your
world.

