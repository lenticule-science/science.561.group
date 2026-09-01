---
name: picking
gerund: picking
agent-noun: picker
imperative: pick
description: A transformer that takes a candidate set and a selection strategy and emits one element or none.
---

A picking transformer reads a candidate set and a selection strategy (an ordering, a key, or a randomization seed) and returns one element of the set chosen by the strategy, or a `none` token when the set is empty. The transformer does not mutate the set; the choice itself is the only output.

Picking is distinct from filtering in that filtering returns a subset (possibly more than one element) while picking returns at most one element. A picking transformer is therefore the composition of filtering (narrow to candidates that satisfy the strategy's prerequisites) followed by a deterministic or random choice on the narrowed set.

## Domain and codomain

- **Domain:** a candidate set and a selection strategy (`oldest`, `newest`, `random`, or a key-derived ordering).
- **Codomain:** one element of the candidate set, or a `none` token when no candidate satisfies the strategy.

## Morphological forms in naming grammar

- `gerund: picking` heads skills built on this transformer: `picking-an-unreviewed-diary-entry`.
- `agent-noun: picker` heads agents that invoke such skills: `picker-of-an-unreviewed-diary-entry`.
- `imperative: pick` heads scripts that body such skills: `pick-unreviewed-entry.mjs`.
