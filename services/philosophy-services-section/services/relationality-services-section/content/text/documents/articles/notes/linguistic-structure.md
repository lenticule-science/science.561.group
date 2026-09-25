---
title: Linguistic Structure (Tokens, Morphology, Syntax)
status: someday
keywords:
  - idea
  - linguistics
  - syntax
description: "Give the relational computer a structural view of language: tokens, morphology, and syntax as recognitions, so it can reason about how utterances are built."
---
# Idea: Linguistic Structure (Tokens, Morphology, Syntax)

Give the relational computer a structural view of language: tokens, morphology,
and syntax as recognitions, so it can reason about how utterances are built.

## 1. Core recognitions

- `UtteranceRecognition`
  - a span of language (sentence, message, turn in dialogue).
  - fields: text, language, speaker, channel, timestamp, context links.

- `TokenRecognition`
  - individual tokens inside an utterance.
  - fields: surface form, lemma, part-of-speech, position, subword info.

- `MorphologicalRecognition`
  - stems, affixes, features (tense, aspect, person, number, gender, case).
  - linked to tokens and lexemes.

- `SyntaxTreeRecognition`
  - dependency/constituency structure for an utterance.
  - fields: nodes, edges, labels; ties back to tokens.

## 2. Measurement and topology

- Topology:
  - token graphs inside utterances (dependencies),
  - recurring syntactic patterns across domains.

- Measurement:
  - sentence length distributions, tree depth, clause density,
  - complexity metrics (e.g., center-embedding).

## 3. Runbooks and uses

- `parse_utterance`: produce tokens, morphology, syntax tree recognitions.
- `summarize_syntax_patterns(slice)`: see what structures dominate a domain
  (e.g., bureaucratic vs conversational style).

These structures feed into semantics, discourse, critical lenses, and agent
voices.
