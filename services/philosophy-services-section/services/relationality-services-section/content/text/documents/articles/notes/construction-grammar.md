---
title: Construction Grammar & Patterns
status: someday
keywords:
  - idea
  - linguistics
  - constructions
description: Model constructions—form–meaning pairings—as recognitions so recurring patterns in your language have explicit structure.
---
# Idea: Construction Grammar & Patterns

Model constructions—form–meaning pairings—as recognitions so recurring patterns
in your language have explicit structure.

## 1. Core recognitions

- `ConstructionRecognition`
  - a schematic pattern (e.g., “the more X, the more Y”, “X is killing me”).
  - fields: syntactic template, semantic/function description.

- `ConstructionInstanceRecognition`
  - a specific use in an utterance.
  - links to tokens, syntax tree, frames.

## 2. Measurement and topology

- Topology:
  - networks of constructions in a language or sociolect,
  - connections between constructions and stances/affect (e.g., sarcasm).

- Measurement:
  - which constructions you favor in different domains,
  - how constructions correlate with outcomes (persuasion, confusion, rapport).

## 3. Runbooks and uses

- `annotate_constructions(text_slice)`,
- `analyze_construction_usage(subject_slice)`,
- `generate_with_construction(agent_id, construction_id)`.

Constructions tie together syntax, semantics, stance, and style.
