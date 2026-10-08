---
name: matching
gerund: matching
agent-noun: matcher
imperative: match
description: A deterministic transformer that takes a token sequence and a pattern set and emits the subset of patterns whose tokens are all present in the sequence.
title: matching
---

A matching transformer reads a token sequence and a set of patterns and returns the subset of patterns whose required tokens all occur in the sequence. The transformer is pure and deterministic: same inputs yield the same output, no state is read, no network is touched.

Matching is distinct from filtering in that matching is performed by membership of a fixed pattern against a fixed token stream, while filtering selects elements of a set against a predicate that may be more general (including non-token predicates).

## Domain and codomain

- **Domain:** a token sequence (a string after tokenization) and a pattern set (each pattern itself a token sequence with optional stopword and stem rules).
- **Codomain:** a subset of the pattern set whose tokens are all present as word tokens in the input sequence.

## Morphological forms in naming grammar

- `gerund: matching` heads skills built on this transformer: `matching-skill-slugs-in-text`.
- `agent-noun: matcher` heads agents that invoke such skills: `matcher-of-skill-slugs-in-text`.
- `imperative: match` heads scripts that body such skills: `match-skill-slugs.mjs`.
